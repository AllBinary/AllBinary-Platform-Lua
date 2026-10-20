-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form.item


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ChoiceGroupItem = {}
ChoiceGroupItem.__index = ChoiceGroupItem
ChoiceGroupItem.className = "ChoiceGroupItem"

function ChoiceGroupItem.new()
    local self = setmetatable({}, ChoiceGroupItem)
    return self
end

return ChoiceGroupItem

