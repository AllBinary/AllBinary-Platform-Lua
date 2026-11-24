--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.game.part

local MakeCountedPartsSingletonArrayFactory = {}
package.loaded["org.allbinary.game.part.MakeCountedPartsSingletonArrayFactory"] = MakeCountedPartsSingletonArrayFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local CountedPickedUpLayerInterfaceFactory = java_lazy("org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory")
local CountedPickedUpLayerInterfaceFactoryPool = java_lazy("org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactoryPool")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local CountedLayerInterfaceFactoryPart = java_lazy("org.allbinary.game.part.CountedLayerInterfaceFactoryPart")
local PartInterface = java_lazy("org.allbinary.game.part.PartInterface")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table MakeCountedPartsSingletonArrayFactory is declared before the requires
MakeCountedPartsSingletonArrayFactory.__index = MakeCountedPartsSingletonArrayFactory
MakeCountedPartsSingletonArrayFactory.className = "MakeCountedPartsSingletonArrayFactory"
MakeCountedPartsSingletonArrayFactory.javaClassName = "org.allbinary.game.part.MakeCountedPartsSingletonArrayFactory"

function MakeCountedPartsSingletonArrayFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.list = BasicArrayListUtil.getInstance():getImmutableInstance()
end

function MakeCountedPartsSingletonArrayFactory._jinit(self)
    MakeCountedPartsSingletonArrayFactory._init_fields(self)
    return self
end

function MakeCountedPartsSingletonArrayFactory.new()
    return MakeCountedPartsSingletonArrayFactory._jinit(setmetatable({}, MakeCountedPartsSingletonArrayFactory))
end


function MakeCountedPartsSingletonArrayFactory.getInstance()
        return MakeCountedPartsSingletonArrayFactory.instance_f
end


-- throws Exception
function MakeCountedPartsSingletonArrayFactory:getUpdated(partInterfaceArray)
        self.list = BasicArrayListD.new()
        for index = 0, (partInterfaceArray.n or #partInterfaceArray) - 1 do
            self.list:add(partInterfaceArray[index + 1])
        end
        local countedBasicArrayList = CountedPickedUpLayerInterfaceFactoryPool.getInstance():getList()
        local layerInterfaceFactoryInterface = nil
        local size = countedBasicArrayList:size()
        for index = 0, size - 1 do
            layerInterfaceFactoryInterface = countedBasicArrayList.objectArray[index + 1]
            self.list:add(CountedLayerInterfaceFactoryPart.new(0, layerInterfaceFactoryInterface))
        end
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Total Parts: ")
        stringBuffer:appendint(self.list:size())
        stringBuffer:append(" Counted: ")
        stringBuffer:appendint(countedBasicArrayList:size())
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(tostring(stringBuffer), self, commonStrings.GET_INSTANCE)
        local newPartInterfaceArray = java_new_array(nil, self.list:size())
        local newSize = (newPartInterfaceArray.n or #newPartInterfaceArray)
        for index = 0, newSize - 1 do
            newPartInterfaceArray[index + 1] = self.list:get(index)
        end
        return newPartInterfaceArray
end

MakeCountedPartsSingletonArrayFactory.instance_f = MakeCountedPartsSingletonArrayFactory.new()

return MakeCountedPartsSingletonArrayFactory

