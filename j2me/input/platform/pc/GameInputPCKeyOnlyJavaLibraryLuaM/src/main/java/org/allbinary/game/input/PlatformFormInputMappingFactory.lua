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
-- package org.allbinary.game.input

local PlatformFormInputMappingFactory = {}
package.loaded["org.allbinary.game.input.PlatformFormInputMappingFactory"] = PlatformFormInputMappingFactory

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

local InputToGameKeyMapping = java_lazy("org.allbinary.game.input.mapping.InputToGameKeyMapping")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table PlatformFormInputMappingFactory is declared before the requires
PlatformFormInputMappingFactory.__index = PlatformFormInputMappingFactory
PlatformFormInputMappingFactory.className = "PlatformFormInputMappingFactory"
PlatformFormInputMappingFactory.javaClassName = "org.allbinary.game.input.PlatformFormInputMappingFactory"

function PlatformFormInputMappingFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.inputToGameKeyMapping = InputToGameKeyMapping.getNullInstance()
end

function PlatformFormInputMappingFactory._jinit(self)
    PlatformFormInputMappingFactory._init_fields(self)
    return self
end

function PlatformFormInputMappingFactory.new()
    return PlatformFormInputMappingFactory._jinit(setmetatable({}, PlatformFormInputMappingFactory))
end


function PlatformFormInputMappingFactory.getInstance()
        if PlatformFormInputMappingFactory.instance_f == NullUtil.getInstance().NULL_OBJECT then
            PlatformFormInputMappingFactory.instance_f = PlatformFormInputMappingFactory.new()
        end
        return PlatformFormInputMappingFactory.instance_f
end


function PlatformFormInputMappingFactory:getOrCreate()
        local try_ok, try_error, try_value = pcall(function()
            if self.inputToGameKeyMapping == InputToGameKeyMapping.getNullInstance() then
                local pcKeyFactory = PCKeyFactory.getInstance()
                local inputToGameKeyMapping = InputToGameKeyMapping.new()
                local gameKeyFactory = GameKeyFactory.getInstance()
                inputToGameKeyMapping:add(gameKeyFactory.UP, pcKeyFactory.DPAD_UP)
                inputToGameKeyMapping:add(gameKeyFactory.DOWN, pcKeyFactory.DPAD_DOWN)
                inputToGameKeyMapping:add(gameKeyFactory.LEFT, pcKeyFactory.DPAD_LEFT)
                inputToGameKeyMapping:add(gameKeyFactory.RIGHT, pcKeyFactory.DPAD_RIGHT)
                inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM1, pcKeyFactory.ENTER)
                self.inputToGameKeyMapping = inputToGameKeyMapping
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
        end
        return self.inputToGameKeyMapping
end

PlatformFormInputMappingFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return PlatformFormInputMappingFactory

