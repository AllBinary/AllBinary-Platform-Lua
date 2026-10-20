-- Generated Code Do Not Modify
-- package org.allbinary.logic.math.permutations

local TsUtil = require("org.allbinary.TsUtil")
local NullUtil = require("org.allbinary.logic.NullUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ObjectPermutationVisitor = {}
ObjectPermutationVisitor.__index = ObjectPermutationVisitor
ObjectPermutationVisitor.className = "ObjectPermutationVisitor"
setmetatable(ObjectPermutationVisitor, {__index = Visitor})

function ObjectPermutationVisitor:_init_fields()
    self.data = nil
    self.stringBuilder = StringMaker.new()
end


function ObjectPermutationVisitor.new(data)
    local self = setmetatable(Visitor.new(), ObjectPermutationVisitor)
    self:_init_fields()
        self.data = data
    return self
end


function ObjectPermutationVisitor:visit(anyType)
        self.stringBuilder:delete(0, self.stringBuilder:length())
        self:print(self.data, self.stringBuilder)
        return NullUtil.getInstance().NULL_OBJECT
end


function ObjectPermutationVisitor:print(data)
        local stringBuilder = StringMaker.new()
        self:print(data, stringBuilder)
end


-- Java overloaded method: Lua keeps the last definition
function ObjectPermutationVisitor:print(data, stringBuilder)
        local tsUtil = TsUtil.getInstance()
        local size = (data.n or #data)
        for i = 0, size - 1 do
            stringBuilder:appendint(java_int(tsUtil:hashCode(data[i + 1])))
            stringBuilder:append(CommonSeps.getInstance().SPACE)
        end
        print(tostring(stringBuilder))
end

return ObjectPermutationVisitor

