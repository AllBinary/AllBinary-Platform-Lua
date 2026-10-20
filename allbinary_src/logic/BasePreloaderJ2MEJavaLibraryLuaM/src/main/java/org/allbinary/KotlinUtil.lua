-- Generated Code Do Not Modify
-- package org.allbinary

local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local KotlinUtil = {}
KotlinUtil.__index = KotlinUtil
KotlinUtil.className = "KotlinUtil"

function KotlinUtil.new()
    local self = setmetatable({}, KotlinUtil)
    return self
end


function KotlinUtil.isKotlin()
        return false
end


function KotlinUtil.getShortName()
        return StringUtil.getInstance().EMPTY_STRING
end

return KotlinUtil

