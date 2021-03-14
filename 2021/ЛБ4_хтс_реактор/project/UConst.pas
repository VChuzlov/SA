﻿unit UConst;

const

  MR: array of real = (
    156.313,	142.286,	128.259,	114.232,	100.205,	86.178,	72.151,	
    58.124,	44.094,	30.07,	16.043,	154.297,	140.26,	126.243,	112.216,	
    98.189,	84.162,	84.162,	148.25,	134.222,	120.195,	106.168,	92.141,	
    78.114,	2.016
  );
  
  DENSITIES: array of real = (
    0.7439,	0.7342,	0.7217,	0.7068,	0.6882,	0.664,	0.631,	0.5844,	0.5077,	
    0.3564,	0.3,	0.8006,	0.8031,	0.7977,	0.7922,	0.774,	0.7834,	0.7536,	
    0.8624,	0.8646,	0.8665,	0.8718,	0.8718,	0.8844,	0.00009
  );

  HEATCAPACITYCOEFFS: array of array of real = (
    (-8.395,1.054,-0.0005799,0.0001237),
    (-7.913,0.9609,-0.0005288,0.0000001131),
    (-8.374,0.8729,-0.0004826,0.0000001031),
    (-6.096,0.7712,-0.0004195,0.00000008855),
    (-5.146,0.6762,-0.0003651,0.00000007658),
    (-4.413,0.582,-0.0003119,0.00000006494),
    (-3.626,0.4873,-0.000258,0.00000005305),
    (9.487,0.3313,-0.0001108,-0.000000002822),
    (-4.224,0.3063,-0.0001586,0.00000003215),
    (5.409,0.1781,-0.00006938,0.000000008713),
    (19.25,0.05213,0.00001197,-0.00000001132),
    (-58.32,1.128,-0.0006536,0.0000001473),
    (-62.96,1.081,-0.0006305,0.00000014),
    (-62.52,0.9889,-0.0005795,0.0000001291),
    (-63.89,0.8893,-0.0005108,0.0000001103),
    (-61.92,0.7842,-0.0004538,0.00000009366),
    (-54.54,0.6113,-0.0002523,0.00000001321),
    (-50.11,0.6381,-0.0003642,0.00000008014),
    (-42.18,0.9772,-0.0006262,0.000000157),
    (-22.99,0.7934,-0.0004396,0.0000000857),
    (-31.29,0.7486,-0.0004601,0.0000001081),
    (-43.1,0.7072,-0.0004811,0.0000001301),
    (-24.35,0.5125,-0.0002765,0.00000004911),
    (-33.92,0.4739,-0.0003017,0.0000000713),
    (27.14,0.009274,-0.00001381,0.000000007645)
  );

  REACTION_ENTHALPIES: array of real = (
    60.9,	-54.2,	-43.44,	-42,	-43.6,	-43.3,	36.5,	-54.3,	-43.54,	-42,	
    -43.7,	-43.2,	35.8,	-54.3,	-43.44,	-42.0000000000001,	-43.5,	36.7,	
    -54.2,	-43.44,	-41.8,	-43.8,	33,	-54.3,	-43.34,	-42.2,	44.1,	60.5,	
    -54.1,	-43.64,	-40.5,	-54.6,	-42.14,	-60.9,	175.8,	-78.6000000000001,	
    -68.54,	-66.2,	-36.5,	199.48,	-55,	-43.34,	-45.5,	-35.8,	201.23,	
    -53.4,	-46.24,	-36.7,	201.71,	-57.9,	-33,	204.93,	-44.1,	206.18,	16.4,	
    -60.5,	-16.4,	-236.7,	-54.92,	-43.11,	-235.98,	-53.25,	-41.11,	-40.05,	
    -237.03,	-52.92,	-42.54,	-238.41,	-54.68,	-237.93,	-206.18
  );
  
  Ea: array of real = (
    188.4059973396,	230.2739967484,	230.2739967484,	230.2739967484,	
    230.2739967484,	230.2739967484,	188.4059973396,	230.2739967484,	
    230.2739967484,	230.2739967484,	230.2739967484,	230.2739967484,	
    188.4059973396,	230.2739967484,	230.2739967484,	230.2739967484,	
    230.2739967484,	188.4059973396,	230.2739967484,	230.2739967484,	
    230.2739967484,	230.2739967484,	188.4059973396,	230.2739967484,	
    230.2739967484,	230.2739967484,	188.4059973396,	188.4059973396,	
    230.2739967484,	230.2739967484,	230.2739967484,	230.2739967484,	
    230.2739967484,	188.4059973396,	125.6039982264,	230.2739967484,	
    230.2739967484,	230.2739967484,	188.4059973396,	125.6039982264,	
    230.2739967484,	230.2739967484,	230.2739967484,	188.4059973396,	
    125.6039982264,	230.2739967484,	230.2739967484,	188.4059973396,	
    125.6039982264,	230.2739967484,	188.4059973396,	125.6039982264,	
    188.4059973396,	125.6039982264,	188.4059973396,	188.4059973396,	
    188.4059973396,	188.4059973396,	167.4719976352,	167.4719976352,	
    188.4059973396,	167.4719976352,	167.4719976352,	167.4719976352,	
    188.4059973396,	167.4719976352,	167.4719976352,	188.4059973396,	
    167.4719976352,	188.4059973396,	125.6039982264
  );
  
  K0: array of real = (
    280266498527.927,	43349806375705.9,	57799741834274.5,	78029651476270.6,	
    78029651476270.6,	110397506903464,	191305503208.669,	8669961275141.18,	
    31211860590508.2,	92479586934839.2,	54909754742560.8,	54909754742560.8,	
    393632722651.583,	17339922550282.4,	22541899315367.1,	39303824447306.7,	
    33523850263879.2,	209412608450.642,	10981950948512.2,	32367855427193.7,	
    19651912223653.3,	40459819283992.2,	59832173843.0406,	15605930295254.1,	
    10403953530169.4,	24853888988738,	0,	33065148702.733,	10403953530169.4,	
    9247958693483.92,	14449935458568.6,	10403953530169.4,	12715943203540.4,	
    39363272265.1583,	266652176.674614,	77451654057927.9,	77451654057927.9,	
    46239793467419.6,	42512334046.3709,	126558869.249839,	77451654057927.9,	
    77451654057927.9,	46239793467419.6,	42512334046.3709,	87261509.2857709,	
    73405672129528.6,	73405672129528.6,	19681636132.5791,	85084918.3512052,	
    4045981928399.22,	14958043460.7601,	31184611.9352324,	160602150841.846,	
    54137752.6997436,	31490617812.1266,	6298123562.42533,	187369175982.153,	
    12596247124.8507,	174329179.355451,	174329179.355451,	12596247124.8507,	
    174329179.355451,	174329179.355451,	0,	12596247124.8507,	145274316.129542,	
    145274316.129542,	8659919898.33482,	29054863.2259084,	12596247124.8507,	
    593615.709427013
  );
  
end.  