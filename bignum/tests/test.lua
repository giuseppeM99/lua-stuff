--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--
--  File Name:              test.lua
--  Package Name:           BigNum
--
--  Project:    Big Numbers library for Lua
--  Mantainers: fmp - Frederico Macedo Pessoa
--              msm - Marco Serpa Molinaro
--
--  History:
--     Version      Autor       Date            Notes
--      alfa     fmp/msm    03/22/2003   Start of Development
--      beta     fmp/msm    07/11/2003   Release
--
--  Description:
--    Tests the Big Numbers (BigNum) library.
--
--$.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
print("Test started\n\n")

dofile "./tests/test_BigNum.lua"
dofile "./tests/test_BigRat.lua"
--dofile "./tests/test_parameter_leak.lua"
dofile "./tests/test_div.lua"
dofile "./tests/test_mul.lua"
dofile "./tests/test_sum.lua"
dofile "./tests/test_sub.lua"

print("Test ended\n\n")
