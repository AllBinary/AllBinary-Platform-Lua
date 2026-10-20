-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form

local CustomDisplayable = require("org.allbinary.graphics.form.CustomDisplayable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CustomScreen = {}
CustomScreen.__index = CustomScreen
CustomScreen.className = "CustomScreen"
setmetatable(CustomScreen, {__index = CustomDisplayable})

function CustomScreen.new()
    local self = setmetatable(CustomDisplayable.new(), CustomScreen)
    return self
end

return CustomScreen

