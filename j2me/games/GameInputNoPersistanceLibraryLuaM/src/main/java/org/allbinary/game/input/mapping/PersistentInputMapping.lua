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
-- package org.allbinary.game.input.mapping

local PersistentInputMapping = {}
package.loaded["org.allbinary.game.input.mapping.PersistentInputMapping"] = PersistentInputMapping

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

local Enumeration = java_lazy("java.util.Enumeration")
local GamePersistanceStrings = java_lazy("org.allbinary.game.configuration.persistance.GamePersistanceStrings")
local Input = java_lazy("org.allbinary.game.input.Input")
local InputPersistance = java_lazy("org.allbinary.game.input.InputPersistance")
local InputMappingEvent = java_lazy("org.allbinary.game.input.mapping.event.InputMappingEvent")
local InputMappingEventListenerInterface = java_lazy("org.allbinary.game.input.mapping.event.InputMappingEventListenerInterface")
local NullInputMappingEventListener = java_lazy("org.allbinary.game.input.mapping.event.NullInputMappingEventListener")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local EnumerationUtil = java_lazy("org.allbinary.util.EnumerationUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local InputToGameKeyMapping = java_lazy("org.allbinary.game.input.mapping.InputToGameKeyMapping")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

--GameInputNoPersistanceLibrary
-- class table PersistentInputMapping is declared before the requires
PersistentInputMapping.__index = PersistentInputMapping
PersistentInputMapping.className = "PersistentInputMapping"
PersistentInputMapping.javaClassName = "org.allbinary.game.input.mapping.PersistentInputMapping"

function PersistentInputMapping:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.enumerationUtil = EnumerationUtil.getInstance()
    self.inputMapping = InputToGameKeyMapping.new()
    self.inputMappingEventListenerInterface = NullInputMappingEventListener.NULL_INPUT_MAPPING_EVENT_LISTENER
    if self.inputPersistance == nil then self.inputPersistance = nil end
    self.inputMappingEvent = InputMappingEvent.new(self)
end


function PersistentInputMapping.getNullInstance()
        if rawequal(PersistentInputMapping.instance_f, NullUtil.getInstance().NULL_OBJECT) then
            PersistentInputMapping.instance_f = PersistentInputMapping.new(GamePersistanceStrings.getInstance().SAVED_INPUT_CONFIGURATION_RECORD_ID)
        end
        return PersistentInputMapping.instance_f
end


function PersistentInputMapping._jinit(self, name)
    PersistentInputMapping._init_fields(self)
        self.inputPersistance = InputPersistance.new(name)
    return self
end

function PersistentInputMapping.new(...)
    local self = setmetatable({}, PersistentInputMapping)
    PersistentInputMapping._jinit(self, ...)
    return self
end


function PersistentInputMapping:getTotalMapped()
        return self:getInputMapping():getHashtable():size()
end


function PersistentInputMapping:isDefaultNew()
        return false
end


function PersistentInputMapping:getDefault()
        return InputToGameKeyMapping.getNullInstance()
end


-- throws Exception
function PersistentInputMapping:setDefault(abeClientInformation)
        self:getInputMapping():removeAll()
        self:getInputMapping():addMapping(self:getDefault())
        self:save(abeClientInformation)
end


-- throws Exception
function PersistentInputMapping:update(abeClientInformation)
        self.inputPersistance:deleteAll(abeClientInformation)
        self:save(abeClientInformation)
end


-- throws Exception
function PersistentInputMapping:save(abeClientInformation)
        self.inputPersistance:save(abeClientInformation, self:getInputMapping():getHashtable())
        self.inputMappingEvent:setInputToGameKeyMapping(self:getInputMapping())
        if not rawequal(self:getInputMappingEventListenerInterface(), nil) then
            self:getInputMappingEventListenerInterface():onInputMappingEvent(self.inputMappingEvent)
        end
end


-- throws Exception
function PersistentInputMapping:init(abeClientInformation)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.INIT)
        local try_ok, try_error, try_value = pcall(function()
            self.inputPersistance:loadAll(abeClientInformation)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e)
            self.inputPersistance:deleteRecoreStore(abeClientInformation)
            self:setDefault(abeClientInformation)
            self.inputPersistance:loadAll(abeClientInformation)
        end
        local list = self.inputPersistance:getList()
        local totalMappedTo = 0
        local size = list:size()
        local hashtable = nil
        local enumeration = nil
        local mappedToInput = nil
        local gameActionInput = nil
        for index = 0, size - 1 do
            hashtable = list.objectArray[index + 1]
            enumeration = hashtable:keys()
            while self.enumerationUtil:hasMoreElements(enumeration) do
                mappedToInput = self.enumerationUtil:nextElement(enumeration)
                gameActionInput = hashtable:get(mappedToInput)
                totalMappedTo = totalMappedTo + 1
                self:getInputMapping():add(gameActionInput, mappedToInput)
            end
        end
        local stringBuffer = StringMaker.new()
        stringBuffer:append("End - Total Loaded Keys Mapped: ")
        stringBuffer:appendint(self:getTotalMapped())
        stringBuffer:append(" to: ")
        stringBuffer:appendint(totalMappedTo)
        self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.INIT)
end


function PersistentInputMapping:setInputMappingEventListenerInterface(inputMappingEventListenerInterface)
        self.inputMappingEventListenerInterface = inputMappingEventListenerInterface
end


function PersistentInputMapping:getInputMappingEventListenerInterface()
        return self.inputMappingEventListenerInterface
end


function PersistentInputMapping:getInputMapping()
        return self.inputMapping
end


-- throws Exception
function PersistentInputMapping:isDelete(input)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function PersistentInputMapping:isSystemInput(input)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end

PersistentInputMapping.instance_f = NullUtil.getInstance().NULL_OBJECT

return PersistentInputMapping

