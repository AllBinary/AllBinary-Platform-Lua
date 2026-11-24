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

local InputPersistance = {}
package.loaded["org.allbinary.game.input.InputPersistance"] = InputPersistance

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

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
local ByteArrayOutputStream = java_lazy("java.io.ByteArrayOutputStream")
-- local DataInputStream = require("java.io.DataInputStream")
-- local DataOutputStream = require("java.io.DataOutputStream")
-- local RecordEnumeration = require("javax.microedition.rms.RecordEnumeration")
-- local RecordStore = require("javax.microedition.rms.RecordStore")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local BasicPersitance = require("org.allbinary.game.configuration.persistance.BasicPersitance")
local NullRecordComparator = java_lazy("org.allbinary.game.configuration.persistance.NullRecordComparator")
local NullRecordFilter = java_lazy("org.allbinary.game.configuration.persistance.NullRecordFilter")
local NullRecordStore = java_lazy("org.allbinary.game.configuration.persistance.NullRecordStore")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local HashtableUtil = java_lazy("org.allbinary.util.HashtableUtil")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

--GameInputPersistanceLibrary
-- class table InputPersistance is declared before the requires
InputPersistance.__index = InputPersistance
InputPersistance.className = "InputPersistance"
InputPersistance.javaClassName = "org.allbinary.game.input.InputPersistance"
setmetatable(InputPersistance, {__index = BasicPersitance})

function InputPersistance:_init_fields()
    self.tsUtil = TsUtil.getInstance()
    self.hashtableUtil = HashtableUtil.getInstance()
end


function InputPersistance._jinit(self, name)
    java_super_init(BasicPersitance, self, name)
    InputPersistance._init_fields(self)
        -- super(...) made self above
    return self
end

function InputPersistance.new(...)
    local self = setmetatable({}, InputPersistance)
    InputPersistance._jinit(self, ...)
    return self
end


-- throws Exception
function InputPersistance:loadAll(abeClientInformation)
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error, try_value = pcall(function()
            recordStore = RecordStore.openRecordStore(self:getRecordId(abeClientInformation), true)
            local recordEnum = recordStore:enumerateRecords(NullRecordFilter.NULL_RECORD_FILTER, NullRecordComparator.NULL_RECORD_COMPARATOR, true)
            local gameActionInputId = 0
            local inputId = 0
            local gameActionInput = nil
            local input = nil
            local hashtable = nil
            local gameKeyFactory = GameKeyMappingFactory.getInstance()
            local stringBuffer = StringMaker.new()
            local inputFactory = InputFactory.getInstance()
            local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
            local stdUtil = StdUtil.getInstance()
            local recordAsBytes = nil
            local byteArrayInputStream = nil
            local inputStream = nil
            while recordEnum:hasNextElement() do
                local id = recordEnum:nextRecordId()
                stringBuffer:delete(0, stringBuffer:length())
                self.logUtil:putF(tostring(stringBuffer:append(self.persistanceStrings.LOADING_ID):appendint(id)), self, self.persistanceStrings.LOAD_ALL)
                recordAsBytes = self.tsUtil:getRecord(recordStore, id)
                if recordAsBytes ~= nil then
                    byteArrayInputStream = ByteArrayInputStream.new(recordAsBytes)
                    inputStream = DataInputStream.new(byteArrayInputStream)
                    hashtable = stdUtil:createHashtable()
                    local value = 0
                    while inputStream:available() > 0 do
                        local gameActionInputIdAsString = inputStream:readUTF()
                        value = math.tointeger(tonumber(gameActionInputIdAsString))
                        gameActionInputId = value
                        inputStream:readUTF()
                        value = math.tointeger(tonumber(inputStream:readUTF()))
                        inputId = value
                        gameActionInput = gameKeyFactory:getGameKey(gameActionInputId)
                        input = inputFactory:getInstanceById(inputId)
                        if input == inputFactory.NO_INPUT or gameActionInput == nil then
                            stringBuffer:delete(0, stringBuffer:length())
                            if input == inputFactory.NO_INPUT then
                                stringBuffer:append(self.persistanceStrings.ERROR_LOADING_ID)
                                stringBuffer:appendlong(inputId)
                                stringBuffer:append(self.persistanceStrings.GAME_ACTION_INPUT)
                                stringBuffer:appendlong(gameActionInputId)
                                PreLogUtil.put(tostring(stringBuffer), self, self.persistanceStrings.LOAD_ALL)
                            end
                            if gameActionInput == nil then
                                stringBuffer:delete(0, stringBuffer:length())
                                stringBuffer:append(self.persistanceStrings.ERROR_LOADING)
                                stringBuffer:appendlong(gameActionInputId)
                                stringBuffer:append(self.persistanceStrings.ID)
                                stringBuffer:appendlong(inputId)
                                PreLogUtil.put(tostring(stringBuffer), self, self.persistanceStrings.LOAD_ALL)
                            end
                        else
                        end
                        hashtable:put(input, gameActionInput)
                    end
                    self.valueList:add(hashtable)
                    self.idList:add(smallIntegerSingletonFactory:getAt(id))
                else
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        do -- finally
            if recordStore ~= nil then
                PreLogUtil.put(self.persistanceStrings.CLOSING_RECORDSTORE, self, self.persistanceStrings.LOAD_ALL)
                recordStore:closeRecordStore()
            end
        end
end
java_overload(InputPersistance, "loadAll", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) end)


-- throws Exception
function InputPersistance:save(abeClientInformation, hashtable)
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            PreLogUtil.put(tostring(stringBuffer:append(self.persistanceStrings.SAVING):append(StringUtil.getInstance():toString(hashtable))), self, self.commonStrings.SAVE)
            recordStore = RecordStore.openRecordStore(self:getRecordId(abeClientInformation), true)
            local byteArrayOutputStream = require("java.io.ByteArrayOutputStream").new()
            local outputStream = DataOutputStream.new(byteArrayOutputStream)
            local gameActionInput = nil
            local list = nil
            local input = nil
            local savedGameBytes = nil
            local commonSeps = CommonSeps.getInstance()
            local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
            local inputObjectArray = self.hashtableUtil:getKeysAsArray(hashtable)
            local size = (inputObjectArray.n or #inputObjectArray)
            for index = 0, size - 1 do
                gameActionInput = inputObjectArray[index + 1]
                list = hashtable:get(inputObjectArray[index + 1])
                for index2 = 0, list:size() - 1 do
                    local gameActionInputIdAsString = tostring(smallIntegerSingletonFactory:getAt(gameActionInput:getId()))
                    outputStream:writeUTF(gameActionInputIdAsString)
                    outputStream:writeUTF(commonSeps.EQUALS)
                    input = list.objectArray[index2 + 1]
                    local inputIdAsString = tostring(smallIntegerSingletonFactory:getAt(input:getId()))
                    outputStream:writeUTF(inputIdAsString)
                end
            end
            savedGameBytes = byteArrayOutputStream:toByteArray()
            recordStore:addRecord(savedGameBytes, 0, (savedGameBytes.n or #savedGameBytes))
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        do -- finally
            if recordStore ~= nil then
                PreLogUtil.put(self.persistanceStrings.CLOSING_RECORDSTORE, self, self.commonStrings.SAVE)
                recordStore:closeRecordStore()
            end
        end
end
java_overload(InputPersistance, "save", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) and (java_a2 == nil or java_is(java_a2, "ABHashtable")) end)

return InputPersistance

