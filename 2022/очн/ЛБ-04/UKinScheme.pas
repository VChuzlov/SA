unit UKinScheme;


interface

uses URegularFunctions, UConst;

function reactions(c, k: array of real): array of real;
function get_k(temperature: real; k0: array of real := UConst.K0; 
         ea: array of real := UConst.Ea): array of real;
function kin_scheme(t: real; c, k0: array of real): array of real;


implementation


function reactions(c, k: array of real): array of real;
begin
  SetLength(result, k.Length);
  
  result[0] := k[0] * c[0];
  result[1] := k[1] * c[0] * c[24];
  result[2] := k[2] * c[0] * c[24];
  result[3] := k[3] * c[0] * c[24];
  result[4] := k[4] * c[0] * c[24];
  result[5] := k[5] * c[0] * c[24];
  result[6] := k[6] * c[1];
  result[7] := k[7] * c[1] * c[24];
  result[8] := k[8] * c[1] * c[24];
  result[9] := k[9] * c[1] * c[24];
  result[10] := k[10] * c[1] * c[24];
  result[11] := k[11] * c[1] * c[24];
  result[12] := k[12] * c[2];
  result[13] := k[13] * c[2] * c[24];
  result[14] := k[14] * c[2] * c[24];
  result[15] := k[15] * c[2] * c[24];
  result[16] := k[16] * c[2] * c[24];
  result[17] := k[17] * c[3];
  result[18] := k[18] * c[3] * c[24];
  result[19] := k[19] * c[3] * c[24];
  result[20] := k[20] * c[3] * c[24];
  result[21] := k[21] * c[3] * c[24];
  result[22] := k[22] * c[4];
  result[23] := k[23] * c[4] * c[24];
  result[24] := k[24] * c[4] * c[24];
  result[25] := k[25] * c[4] * c[24];
  result[26] := k[26] * c[5];
  result[27] := k[27] * c[5];
  result[28] := k[28] * c[5] * c[24];
  result[29] := k[29] * c[5] * c[24];
  result[30] := k[30] * c[5] * c[24];
  result[31] := k[31] * c[6] * c[24];
  result[32] := k[32] * c[6] * c[24];
  result[33] := k[33] * c[11] * c[24];
  result[34] := k[34] * c[11] * c[24];
  result[35] := k[35] * c[11] * c[24];
  result[36] := k[36] * c[11] * c[24];
  result[37] := k[37] * c[11] * c[24];
  result[38] := k[38] * c[12] * c[24];
  result[39] := k[39] * c[12] * c[24];
  result[40] := k[40] * c[12] * c[24];
  result[41] := k[41] * c[12] * c[24];
  result[42] := k[42] * c[12] * c[24];
  result[43] := k[43] * c[13] * c[24];
  result[44] := k[44] * c[13] * c[24];
  result[45] := k[45] * c[13] * c[24];
  result[46] := k[46] * c[13] * c[24];
  result[47] := k[47] * c[14] * c[24];
  result[48] := k[48] * c[14] * c[24];
  result[49] := k[49] * c[14] * c[24];
  result[50] := k[50] * c[15] * c[24];
  result[51] := k[51] * c[15];
  result[52] := k[52] * c[16] * c[24];
  result[53] := k[53] * c[16];
  result[54] := k[54] * c[16];
  result[55] := k[55] * c[17] * c[24];
  result[56] := k[56] * c[17];
  result[57] := k[57] * c[18] * 4 * c[24];
  result[58] := k[58] * c[18] * c[24];
  result[59] := k[59] * c[18] * c[24];
  result[60] := k[60] * c[19] * 4 * c[24];
  result[61] := k[61] * c[19] * c[24];
  result[62] := k[62] * c[19] * c[24];
  result[63] := k[63] * c[19] * c[24];
  result[64] := k[64] * c[20] * 4 * c[24];
  result[65] := k[65] * c[20] * c[24];
  result[66] := k[66] * c[20] * c[24];
  result[67] := k[67] * c[21] * 4 * c[24];
  result[68] := k[68] * c[21] * c[24];
  result[69] := k[69] * c[22] * 4 * c[24];
  result[70] := k[70] * c[23] * 3 * c[24];

end;


function get_k(temperature: real; k0: array of real; 
               ea: array of real): array of real;
begin
  result := ArrFill(k0.Length, 0.0);
  for var i := 0 to result.High do
    result[i] := k0[i] * exp(-ea[i] * 1000 / (8.314 * temperature))
end;


function kin_scheme(t: real; c, k0: array of real): array of real;
begin
  SetLength(result, c.Length);
 
  var k := get_k(c[^1]);
  var r := reactions(c[:^1], k);
  
  result[0] := k[33] * c[11] + k[57] * c[18] - (k[0] + k[1] + k[2] + k[3] 
               + k[4] + k[5]) * c[0];
  result[1] := k[1] * c[0] + k[38] * c[12] + k[60] * c[19] - (k[6] + k[7] 
               + k[8] + k[9] + k[10] + k[11]) * c[1];
  result[2] := k[2] * c[0] + k[7] * c[1] + k[43] * c[13] + k[64] * c[20] 
                - (k[12] + k[13] + k[14] + k[15] + k[16]) * c[2];
  result[3] := k[3] * c[0] + k[8] * c[1] + k[13] * c[2] + k[47] * c[14] 
               + k[68] * c[21] - (k[17] + k[18] + k[19] + k[20] + k[21]) * c[3];
  result[4] := k[4] * c[0] + k[9] * c[1] + k[14] * c[2] + k[18] * c[3] 
               + k[50] * c[15] + k[69] * c[22] - (k[22] + k[23] + k[24] 
               + k[25]) * c[4];
  result[5] := k[5] * c[0] + k[10] * c[1] + k[15] * c[2] + k[19] * c[3] 
               + k[23] * c[4] + k[52] * c[16] + k[55] * c[17] 
               - (k[26] + k[27] + k[28] + k[29] + k[30]) * c[5];
  result[6] := k[5] * c[0] + 2 * k[11] * c[1] + k[16] * c[2] + k[20] * c[3] 
               + k[24] * c[4] + k[28] * c[5] - (k[31] + k[32]) * c[6];
  result[7] := k[4] * c[0] + k[10] * c[1] + k[16] * c[2] + 2 * k[21] * c[3] 
               + k[25] * c[4] + k[29] * c[5] + k[31] * c[6];
  result[8] := k[3] * c[0] + k[9] * c[1] + k[15] * c[2] + k[20] * c[3] 
               + k[25] * c[4] + 2 * k[30] * c[5] + k[32] * c[6] 
               + k[37] * c[11] + k[42] * c[12] + k[63] * c[19];
  result[9] := k[2] * c[0] + k[8] * c[1] + k[14] * c[2] + k[19] * c[3] 
               + k[24] * c[4] + k[29] * c[5] + k[32] * c[6] + k[36] * c[11] 
               + k[41] * c[12] + k[46] * c[13] + k[59] * c[18] 
               + k[63] * c[19] + k[66] * c[20];
  result[10] := k[1] * c[0] + k[7] * c[1] + k[13] * c[2] + k[18] * c[3] 
                + k[23] * c[4] + k[28] * c[5] + k[31] * c[6] + k[35] * c[11] 
                + k[40] * c[12] + k[45] * c[13] + k[49] * c[14] + k[58] * c[18] 
                + k[61] * c[19] + k[65] * c[20] + k[68] * c[21];
  result[11] := k[0] * c[0] - (k[33] + k[34] + k[35] + k[36] + k[37] 
                + k[37]) * c[11];
  result[12] := k[6] * c[1] + +k[35] * c[11] - (k[38] + k[39] + k[40] + k[41] 
                + k[42]) * c[12];
  result[13] := k[12] * c[2] + k[36] * c[11] + k[40] * c[12] - (k[43] + k[44] 
                + k[45] + k[46]) * c[13];
  result[14] := k[17] * c[3] + k[37] * c[11] + k[41] * c[12] + k[45] * c[13] 
                - (k[47] + k[48] + k[49]) * c[14];
  result[15] := k[22] * c[4] + k[42] * c[12] + k[46] * c[13] + k[49] * c[14] 
                - (k[52] + k[53] + k[54]) * c[15];
  result[16] := k[26] * c[5] + k[56] * c[17] + k[70] * c[23] - (k[52] + k[53] 
                + k[54]) * c[16];
  result[17] := k[27] * c[5] + k[54] * c[16] - (k[55] + k[56]) * c[17];
  result[18] := k[34] * c[11] - (k[57] + k[58] + k[59]) * c[18];
  result[19] := k[39] * c[12] + k[58] * c[18] - (k[60] + k[61] + k[62] 
                + k[63]) * c[19];
  result[20] := k[44] * c[13] + k[59] * c[18] - (k[61] * c[19] 
                - (k[64] + k[65] + k[66])) * c[20];
  result[21] := k[48] * c[14] + k[62] * c[19] + k[65] * c[20] 
                - (k[67] + k[68]) * c[21];
  result[22] := k[51] * c[15] + k[63] * c[19] + k[66] * c[20] + k[68] * c[21] 
                - k[69] * c[22];
  result[23] := k[53] * c[16] - k[70] * c[23];
  result[24] := (k[0] - (k[1] + k[2] + k[3] + k[4] + k[5])) * c[0] 
                + (k[6] - (k[7] + k[8] + k[9] + k[10] + k[11])) * c[1] 
                + (k[12] - (k[13] + k[14] + k[15] + k[16])) * c[2] + (k[17] 
                - (k[18] + k[19] + k[20] + k[21])) * c[3] + (k[22] - (k[23] 
                + k[24] + k[25])) * c[4] + (k[26] + k[27] - (k[28] + k[29] 
                + k[30])) * c[5] - (k[31] + k[32]) * c[6] + (3 * k[34] 
                - (k[33] + k[35] + k[36] + k[37])) * c[11] + (3 * k[39] 
                - (k[38] + k[40] + k[41] + k[42])) * c[12] + (3 * k[44] 
                - (k[43] + k[45] + k[46])) * c[13] + (3 * k[48] - (k[47] 
                + k[49])) * c[14] + (3 * k[51] - k[50]) * c[15] + (3 * k[53] 
                - k[52]) * c[16] + (4 * k[57] + k[58] + k[59]) * c[18] 
                + (4 * k[60] + k[61] + k[62] + k[63]) * c[19] + (4 * k[64] 
                + k[65] + k[66]) * c[20] + (4 * k[67] + k[68]) * c[21] 
                + 4 * k[69] * c[22] + 3 * k[70] * c[23] - k[55] * c[17];
  
  var mass_fractions := convert_molar_to_mass_fractions(c[:^1], UConst.MR);
  var flow_density := get_flow_density(mass_fractions, 
      get_ideal_gas_den(c[^1], 0.105, UConst.MR));
  var heat_capacity := get_flow_cp(mass_fractions,  
    UConst.HEATCAPACITYCOEFFS, c[^1]);
  result[25] := 0.0;
  for var i := 0 to r.High do
    result[25] += -UConst.REACTION_ENTHALPIES[i] * r[i] / (flow_density 
                                                          * heat_capacity*1e-3);
end;  


end.