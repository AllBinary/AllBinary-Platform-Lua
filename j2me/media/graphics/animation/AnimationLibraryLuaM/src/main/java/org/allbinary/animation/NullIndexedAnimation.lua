-- Generated Code Do Not Modify
-- package org.allbinary.animation

local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullIndexedAnimation = {}
NullIndexedAnimation.__index = NullIndexedAnimation
NullIndexedAnimation.className = "NullIndexedAnimation"
setmetatable(NullIndexedAnimation, {__index = IndexedAnimation})


function NullIndexedAnimation.new(animationBehavior)
    local self = setmetatable(IndexedAnimation.new(animationBehavior), NullIndexedAnimation)
        -- super(...) made self above
    return self
end


-- throws Exception
function NullIndexedAnimation:getAnimationSize()
        return 0
end

return NullIndexedAnimation

