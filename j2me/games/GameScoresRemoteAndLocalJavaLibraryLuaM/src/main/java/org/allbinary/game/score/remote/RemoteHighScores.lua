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
-- package org.allbinary.game.score.remote

local RemoteHighScores = {}
package.loaded["org.allbinary.game.score.remote.RemoteHighScores"] = RemoteHighScores

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
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local HighScore = java_lazy("org.allbinary.game.score.HighScore")
local HighScores = require("org.allbinary.game.score.HighScores")
local RemoteErrorHighScoresSingletonFactory = java_lazy("org.allbinary.game.score.RemoteErrorHighScoresSingletonFactory")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local SoftwareInformation = java_lazy("org.allbinary.logic.system.SoftwareInformation")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local EnumerationUtil = java_lazy("org.allbinary.util.EnumerationUtil")
local RemoteHighScoresData = java_lazy("org.allbinary.game.score.remote.RemoteHighScoresData")
local RemoteHighScoresProcessorFactory = java_lazy("org.allbinary.game.score.remote.RemoteHighScoresProcessorFactory")
local RemoteHighScoresSubmissionProcessorFactory = java_lazy("org.allbinary.game.score.remote.RemoteHighScoresSubmissionProcessorFactory")

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

-- class table RemoteHighScores is declared before the requires
RemoteHighScores.__index = RemoteHighScores
RemoteHighScores.className = "RemoteHighScores"
RemoteHighScores.javaClassName = "org.allbinary.game.score.remote.RemoteHighScores"
setmetatable(RemoteHighScores, {__index = HighScores})

function RemoteHighScores:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.enumerationUtil = EnumerationUtil.getInstance()
    if self.abeClientInformation == nil then self.abeClientInformation = nil end
    if self.softwareInformation == nil then self.softwareInformation = nil end
    if self.ascending == nil then self.ascending = nil end
    self.ASCENDING = "ASCENDING"
end


function RemoteHighScores._jinit(self, abeClientInformation, softwareInformation, gameInfo, heading, columnTwoHeading, ascending, preload)
    java_super_init(HighScores, self, tostring(gameInfo), heading, columnTwoHeading)
    RemoteHighScores._init_fields(self)
        -- super(...) made self above
        self.abeClientInformation = abeClientInformation
        self.softwareInformation = softwareInformation
        self:setAscending(ascending)
        if preload then
            RemoteHighScoresProcessorFactory.getInstance():process(self, self.abeClientInformation, gameInfo)
        end
    return self
end

function RemoteHighScores.new(...)
    local self = setmetatable({}, RemoteHighScores)
    RemoteHighScores._jinit(self, ...)
    return self
end


function RemoteHighScores.getInstance(abeClientInformation, softwareInformation, gameInfo, heading, columnTwoHeading, isAscending)
        return RemoteHighScores.getInstancePreload(abeClientInformation, softwareInformation, gameInfo, heading, columnTwoHeading, isAscending, true)
end


function RemoteHighScores.getInstancePreload(abeClientInformation, softwareInformation, gameInfo, heading, columnTwoHeading, isAscending, preload)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            local highScores = RemoteHighScores.hashTable:get(gameInfo)
            if rawequal(highScores, nil) then
                highScores = RemoteHighScores.new(abeClientInformation, softwareInformation, gameInfo, heading, columnTwoHeading, isAscending, preload)
                RemoteHighScores.hashTable:put(gameInfo, highScores)
            end
            do return "__jreturn", highScores end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            logUtil:put(commonStrings.EXCEPTION, RemoteErrorHighScoresSingletonFactory.getInstance(), commonStrings.GET_INSTANCE, e)
            return RemoteErrorHighScoresSingletonFactory.getInstance()
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function RemoteHighScores:addHighScore(newHighScore)
        RemoteHighScoresSubmissionProcessorFactory.getInstance():process(self, self.abeClientInformation, newHighScore)
end
java_overload(RemoteHighScores, "addHighScore", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HighScore")) end)


function RemoteHighScores:update(hashtable)
        self:getList():clear()
        local vector = hashtable:get(RemoteHighScoresData.getInstance().HIGH_SCORES)
        if not rawequal(vector, nil) then
            local size = vector:size()
            for index = 0, size - 1 do
                local highScoreVector = vector:get(index)
                local displayName = highScoreVector:get(0)
                local score = highScoreVector:get(1)
                local longScore = math.tointeger(tonumber(score))
                local highScore = HighScore.new(-1, displayName, nil, longScore)
                self:getList():add(highScore)
            end
        else
            local NEXT_ELEMENT = tostring(StringMaker.new():append(CommonLabels.getInstance().NEXT):append("Element: "))
            local commonStrings = CommonStrings.getInstance()
            local enumeration = hashtable:elements()
            local nextElement = nil
            while self.enumerationUtil:hasMoreElements(enumeration) do
                nextElement = self.enumerationUtil:nextElement(enumeration)
                self.logUtil:putF(require("allbinary_java").to_string(NEXT_ELEMENT) .. require("allbinary_java").to_string(nextElement), self, commonStrings.PROCESS)
            end
        end
end
java_overload(RemoteHighScores, "update", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ABHashtable")) end)


function RemoteHighScores:setAscending(ascending)
        self.ascending = ascending
end
java_overload(RemoteHighScores, "setAscending", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "boolean") end)


function RemoteHighScores:getAscending()
        return self.ascending
end
java_overload(RemoteHighScores, "getAscending", 0)


function RemoteHighScores:getSoftwareInformation()
        return self.softwareInformation
end
java_overload(RemoteHighScores, "getSoftwareInformation", 0)

RemoteHighScores.hashTable = StdUtil.getInstance():createHashtable()

return RemoteHighScores

