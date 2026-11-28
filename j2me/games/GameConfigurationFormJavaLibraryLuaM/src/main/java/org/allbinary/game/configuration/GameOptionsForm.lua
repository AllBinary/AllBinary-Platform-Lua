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
-- package org.allbinary.game.configuration

local GameOptionsForm = {}
package.loaded["org.allbinary.game.configuration.GameOptionsForm"] = GameOptionsForm

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

local Choice = java_lazy("javax.microedition.lcdui.Choice")
local Command = java_lazy("javax.microedition.lcdui.Command")
local CommandListener = java_lazy("javax.microedition.lcdui.CommandListener")
local Item = java_lazy("javax.microedition.lcdui.Item")
local TextField = java_lazy("javax.microedition.lcdui.TextField")
local MIDPUtil = java_lazy("org.allbinary.MIDPUtil")
local GameCommandsFactory = java_lazy("org.allbinary.game.commands.GameCommandsFactory")
local GameFeatureChoiceGroups = java_lazy("org.allbinary.game.configuration.feature.GameFeatureChoiceGroups")
local GameFeatureFormUtil = java_lazy("org.allbinary.game.configuration.feature.GameFeatureFormUtil")
local GameFeatureItemCommandListener = java_lazy("org.allbinary.game.configuration.feature.GameFeatureItemCommandListener")
local GameFeatureItemStateListener = java_lazy("org.allbinary.game.configuration.feature.GameFeatureItemStateListener")
local SensorFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.SensorFeatureFactory")
local GameConfigurationPersistanceSingleton = java_lazy("org.allbinary.game.configuration.persistance.GameConfigurationPersistanceSingleton")
local KeyValuePersistance = java_lazy("org.allbinary.game.configuration.persistance.KeyValuePersistance")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local MyCommandsFactory = java_lazy("org.allbinary.graphics.displayable.command.MyCommandsFactory")
local CommandForm = require("org.allbinary.graphics.displayable.screen.CommandForm")
local OrientationData = java_lazy("org.allbinary.input.gyro.OrientationData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local HashtableUtil = java_lazy("org.allbinary.util.HashtableUtil")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local GameConfiguration = java_lazy("org.allbinary.game.configuration.GameConfiguration")
local GameConfigurationCentral = java_lazy("org.allbinary.game.configuration.GameConfigurationCentral")
local GameConfigurationGauge = java_lazy("org.allbinary.game.configuration.GameConfigurationGauge")
local GameConfigurationSingleton = java_lazy("org.allbinary.game.configuration.GameConfigurationSingleton")
local GameConfigurationTextInput = java_lazy("org.allbinary.game.configuration.GameConfigurationTextInput")
local GameConfigurationUtil = java_lazy("org.allbinary.game.configuration.GameConfigurationUtil")

local function java_instanceof(object, class)
    class = java_real(class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
end

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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table GameOptionsForm is declared before the requires
GameOptionsForm.__index = GameOptionsForm
GameOptionsForm.className = "GameOptionsForm"
GameOptionsForm.javaClassName = "org.allbinary.game.configuration.GameOptionsForm"
setmetatable(GameOptionsForm, {__index = CommandForm})

function GameOptionsForm:_init_fields()
    self.meUtil = MIDPUtil.getInstance()
end


function GameOptionsForm._jinit(self, commandListener, title, backgrounBasicColor, foregroundBasicColor)
    java_super_init(CommandForm, self, commandListener, title, backgrounBasicColor, foregroundBasicColor)
    GameOptionsForm._init_fields(self)
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:addConfiguration()
        local gameFeatureFormUtil = GameFeatureFormUtil.getInstance()
        gameFeatureFormUtil:addChoiceGroup(self, GameFeatureChoiceGroups.getExclusiveInstance():get(), Choice.EXCLUSIVE)
        gameFeatureFormUtil:addChoiceGroup(self, GameFeatureChoiceGroups.getMultipleInstance():get(), Choice.MULTIPLE)
        self:initCommands(commandListener)
        self:setItemStateListener(GameFeatureItemStateListener.new(self))
        self:addTextFieldsIfSimulated()
    return self
end

function GameOptionsForm.new(...)
    local self = setmetatable({}, GameOptionsForm)
    GameOptionsForm._jinit(self, ...)
    return self
end


-- throws Exception
function GameOptionsForm:closeClientInformation(abeClientInformation)
        java_super(CommandForm, "close", 0)(self)
        self:save(abeClientInformation)
end
java_overload(GameOptionsForm, "closeClientInformation", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) end)


function GameOptionsForm:addTextFieldsIfSimulated()
        local key = OrientationData.getInstance().ORIENTATION_SENSOR_INPUT
        local hashtable = GameFeatureChoiceGroups.getExclusiveInstance():get()
        if not rawequal(hashtable, nil) then
            local listCanBeNull = hashtable:get(key)
            if not rawequal(listCanBeNull, nil) then
                local list = listCanBeNull
                if list:contains(SensorFeatureFactory.getInstance().SIMULATED_ORIENTATION_SENSORS) then
                    self:addTextFields()
                end
            end
        end
end
java_overload(GameOptionsForm, "addTextFieldsIfSimulated", 0)


function GameOptionsForm:addTextFields()
        local hashtable = GameConfigurationTextInput.getHashtable()
        local size = hashtable:size()
        local objectArray = HashtableUtil.getInstance():getKeysAsArray(hashtable)
        local gameConfigurationTextInput = nil
        local textField = nil
        for index = 0, size - 1 do
            gameConfigurationTextInput = hashtable:get(objectArray[index + 1])
            textField = TextField.new(gameConfigurationTextInput:getLabel(), gameConfigurationTextInput:getText(), 30, TextField.ANY)
            self.meUtil:appendItem(self, textField)
        end
end
java_overload(GameOptionsForm, "addTextFields", 0)


function GameOptionsForm:addConfiguration()
        local METHOD_NAME = "addConfiguration"
        local NAME = "Name: "
        local list = GameConfigurationSingleton.getInstance():getOptionsBasicArrayList()
        local GAUGE_CHANGE = MyCommandsFactory.getInstance().GAUGE_CHANGE
        local stringMaker = StringMaker.new()
        local size = list:size()
        local gameConfiguration = nil
        local gauge = nil
        for index = 0, size - 1 do
            gameConfiguration = list.objectArray[index + 1]
            stringMaker:delete(0, stringMaker:length())
            self.logUtil:putF(tostring(stringMaker:append(NAME):append(tostring(gameConfiguration))), self, METHOD_NAME)
            gauge = GameConfigurationGauge.new(gameConfiguration)
            gauge:setDefaultCommand(GAUGE_CHANGE)
            gauge:setItemCommandListener(GameFeatureItemCommandListener.new(self))
            self.meUtil:appendItem(self, gauge)
        end
end
java_overload(GameOptionsForm, "addConfiguration", 0)


function GameOptionsForm:initCommands(cmdListener)
        local gameCommandsFactory = GameCommandsFactory.getInstance()
        self:removeAllCommands()
        self:addCommand(gameCommandsFactory.CLOSE_OPTIONS)
        self:addCommand(gameCommandsFactory.DEFAULT_OPTIONS)
        self:setCommandListener(cmdListener)
end
java_overload(GameOptionsForm, "initCommands", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CommandListener")) end)


-- throws Exception
function GameOptionsForm:save(abeClientInformation)
        local size = self:size()
        local item = nil
        for index = 0, size - 1 do
            item = self:get(index)
            if java_instanceof(item, GameConfigurationGauge) then
                GameConfigurationUtil.getInstance():update(item)
            elseif java_instanceof(item, TextField) then
                GameConfigurationTextInput.update(item)
            end
        end
        GameConfigurationUtil.getInstance():updateCompetitionValue()
        local hashtable = StdUtil.getInstance():createHashtable()
        local SCALE = GameConfigurationCentral.getInstance().SCALE
        hashtable:put(SCALE:getName(), tostring(require("allbinary_java").number_value(SCALE:getValue(), "intValue")))
        local keyValuePersistance = GameConfigurationPersistanceSingleton.getInstance()
        keyValuePersistance:clear()
        keyValuePersistance:loadAll(abeClientInformation)
        local list = keyValuePersistance:getIds()
        keyValuePersistance:save(abeClientInformation, hashtable)
        local size2 = list:size()
        local integer = nil
        for index = 0, size2 - 1 do
            integer = list.objectArray[index + 1]
            keyValuePersistance:delete(abeClientInformation, require("allbinary_java").number_value(integer, "intValue"))
        end
end
java_overload(GameOptionsForm, "save", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) end)

return GameOptionsForm

