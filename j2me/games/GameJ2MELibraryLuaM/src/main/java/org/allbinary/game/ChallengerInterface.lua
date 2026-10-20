-- 
-- To change this license header, choose License Headers in Project Properties. 
-- To change this template file, choose Tools | Templates 
-- and open the template in the editor.  
-- Generated Code Do Not Modify
-- package org.allbinary.game


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local ChallengerInterface = {}
ChallengerInterface.__index = ChallengerInterface
ChallengerInterface.className = "ChallengerInterface"


function ChallengerInterface:setWinner(isWinner)
    error("abstract method setWinner")
end

return ChallengerInterface

