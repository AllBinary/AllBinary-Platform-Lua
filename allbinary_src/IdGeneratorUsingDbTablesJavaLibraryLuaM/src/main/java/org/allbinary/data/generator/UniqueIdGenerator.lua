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
-- package org.allbinary.data.generator

local UniqueIdGenerator = {}
package.loaded["org.allbinary.data.generator.UniqueIdGenerator"] = UniqueIdGenerator

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

-- local IOException = require("java.io.IOException")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local IdGeneratorEntity = java_lazy("org.allbinary.data.tables.generator.IdGeneratorEntity")
local IdGeneratorEntityFactory = java_lazy("org.allbinary.data.tables.generator.IdGeneratorEntityFactory")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local IdGeneratorInterface = require("org.allbinary.data.generator.IdGeneratorInterface")

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

-- class table UniqueIdGenerator is declared before the requires
UniqueIdGenerator.__index = UniqueIdGenerator
UniqueIdGenerator.className = "UniqueIdGenerator"
UniqueIdGenerator.javaClassName = "org.allbinary.data.generator.UniqueIdGenerator"
UniqueIdGenerator.java_implements = " IdGeneratorInterface "
UniqueIdGenerator.java_interfaces = function() return {IdGeneratorInterface} end

function UniqueIdGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.idGeneratorEntity == nil then self.idGeneratorEntity = nil end
    if self.name_f == nil then self.name_f = nil end
end


function UniqueIdGenerator._jinit(self)
    UniqueIdGenerator._init_fields(self)
        self.idGeneratorEntity = IdGeneratorEntityFactory.getInstance()
    return self
end

function UniqueIdGenerator.new(...)
    local self = setmetatable({}, UniqueIdGenerator)
    UniqueIdGenerator._jinit(self, ...)
    return self
end


function UniqueIdGenerator:initialize(value)
        local try_ok, try_error, try_value = pcall(function()
            local vector = BasicArrayListD.new()
            vector:add(self.name_f)
            vector:add(tostring(tostring(value)))
            self.idGeneratorEntity:insert(vector)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().IDLOGGING) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "initialize", e)
            end
        end
end


-- throws Exception
function UniqueIdGenerator:setFile(filePathName, name)
        self.name_f = name
end


-- throws IOException
function UniqueIdGenerator:getNext()
        local try_ok, try_error, try_value = pcall(function()
            local idLong = self.idGeneratorEntity:get(self.name_f)
            local newValue = tostring(require("allbinary_java").number_value(idLong, "longValue") + 1)
            self.idGeneratorEntity:update(self.name_f, newValue)
            do return "__jreturn", tostring(idLong) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().IDLOGGING) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "getNext", e)
            end
            return "Error"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

UniqueIdGenerator.EXT = ".unq"

return UniqueIdGenerator

