Unit UGeneticAlgorithm;


interface


const
 POP_SIZE = 100;
 SELECTSIZE = 20;
 MUTATIONLIMITS: array of real = (0.5, 1.2);
 MUTATIONRANGE = 1.5;
 GENERATIONSCOUNT = 10;
 

function create_population(bounds: array of array of real; popsize: integer;
 initial_guess: array of array of real := nil
 ): array of array of real;
 
function selection(fun: function(genes, act_values: array of real): real; 
 population: array of array of real; selected: integer; 
 act_values: array of real): array of array of real;
 
function mutate(selected_pop: array of array of real; limits: array of real; 
 range: real): array of array of real;
 
function crossover(mutated: array of array of real; 
 popsize: integer): array of array of real; 

function genetic_algorithm(
 bounds: array of array of real; 
 fun: function(genes, act_values: array of real): real; 
 actual_values: array of real;
 popsize: integer := POP_SIZE; selection_size: integer := SELECTSIZE; 
 mutation_limits: array of real := MUTATIONLIMITS; 
 mutation_range: real := MUTATIONRANGE;
 generations_count: integer := GENERATIONSCOUNT
 ): array of array of real;
 
 
implementation


function create_population(bounds: array of array of real; popsize: integer;
 initial_guess: array of array of real
 ): array of array of real;
begin
 var population: array of array of real;
 SetLength(population, popsize);
 for var i := 0 to popsize-1 do
 begin
 SetLength(population[i], bounds.Length);
 for var j := 0 to bounds.High do
 population[i, j] := Random(bounds[j, 0], bounds[j, 1]);
 end;
 
 result := population
end;


function selection(fun: function(genes, act_values: array of real): real; 
 population: array of array of real; selected: integer; 
 act_values: array of real): array of array of real;
begin
 var fitness := new real [population.Length];
 
 foreach var i in population.Indices do
 fitness[i] := fun(population[i], act_values);
 
 var sorted_population: array of array of real;
 SetLength(sorted_population, population.Length);
 foreach var i in sorted_population.Indices do
 SetLength(sorted_population[i], population[0].Length+1);
 
 foreach var i in population.Indices do
 begin
 sorted_population[i][:^1] := copy(population[i]);
 sorted_population[i][^1] := fitness[i];
 end; 
 
 foreach var i in fitness.Indices do
 for var j := i+1 to fitness.High do
 if sorted_population[i][^1] > sorted_population[j][^1] then
 (sorted_population[i], sorted_population[j]) := (sorted_population[j], 
 sorted_population[i]);
 
 result := sorted_population[:selected]
end;


function mutate(selected_pop: array of array of real; limits: array of real; 
 range: real): array of array of real;
begin
 var indexes := ArrRandomInteger(selected_pop.Length, 0, selected_pop.High);
 var mutation_coeff := Random(limits[0] * range, limits[1] * range);
 
 var mutated := selected_pop;
 
 foreach var i in indexes do
 for var j := 0 to mutated[i].High do
 mutated[i][j] *= mutation_coeff;
 
 result := selected_pop + mutated; 
end;


function crossover(mutated: array of array of real; 
 popsize: integer): array of array of real;

 function mix_genome(genome1, genome2: array of real): array of real;
 begin
 var s := Random(1, genome1.Length-1);
 result := genome1[:s] + genome2[s:];
 end;
 
begin
 var crossovered := Trunc((popsize - mutated.Length) / 2);
 if crossovered = 0 then
 crossovered := 1;
 
 var count := 0;
 
 var genome1, genome2: array of array of real;
 
 while count <> crossovered do
 begin
 SetLength(genome1, count+1);
 SetLength(genome2, count+1);
 
 var index1 := Random(mutated.Length-1);
 var index2 := Random(mutated.Length-1);
 
 if index1 = index2 then
 continue;
 
 genome1[count] := mutated[index1];
 genome2[count] := mutated[index2];
 
 count += 1;
 end;
 
 var new1, new2: array of array of real;
 SetLength(new1, crossovered);
 SetLength(new2, crossovered);
 foreach var i in new1.Indices do
 begin
 SetLength(new1[i], genome1[i].High);
 SetLength(new2[i], genome2[i].High);
 end;
 
 foreach var i in new1.Indices do
 begin
 new1[i] := mix_genome(genome1[i], genome2[i]);
 new2[i] := mix_genome(genome2[i], genome1[i]);
 end;
 
 result := mutated + new1 + new2;
 result := result[:popsize];
end;


function genetic_algorithm(
 bounds: array of array of real; 
 fun: function(genes, act_values: array of real): real; 
 actual_values: array of real; popsize: integer; selection_size: integer; 
 mutation_limits: array of real; mutation_range: real;
 generations_count: integer): array of array of real;

begin
 SetLength(result, generations_count);
 foreach var i in result.Indices do
 SetLength(result[i], selection_size);
 
 var selected, mutated, crossovered: array of array of real;
 var population := create_population(bounds, popsize);
 var mutation_decrease := mutation_range / generations_count;
 
 SetLength(selected, selection_size);
 
 foreach var i in range(1, generations_count) do
 begin
 foreach var j in range(0, selection_size-1) do
 selected[j] := selection(fun, population, selection_size, 
 actual_values)[j][:^1];
 
 mutated := mutate(selected, mutation_limits, mutation_range);
 crossovered := crossover(mutated, popsize);
 population := crossovered;
 result[i-1] := selection(fun, population, selection_size, actual_values)[0];
 mutation_range -= mutation_decrease;
 end;
 
 foreach var i in result.Indices do
 for var j := i+1 to result.High do
 if result[i][^1] > result[j][^1] then
 (result[i], result[j]) := (result[j], result[i])
 
end;



end.