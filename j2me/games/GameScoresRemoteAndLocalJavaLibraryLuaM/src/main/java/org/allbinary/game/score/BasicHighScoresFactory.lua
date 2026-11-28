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
-- package org.allbinary.game.score

local BasicHighScoresFactory = {}
package.loaded["org.allbinary.game.score.BasicHighScoresFactory"] = BasicHighScoresFactory

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

local ARunnable = java_lazy("org.allbinary.thread.ARunnable")
local BasicHighScoresGameInfoFactory = java_lazy("org.allbinary.game.BasicHighScoresGameInfoFactory")
local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local GameType = java_lazy("org.allbinary.game.GameType")
local GameTypeFactory = java_lazy("org.allbinary.game.GameTypeFactory")
local RemoteHighScores = java_lazy("org.allbinary.game.score.remote.RemoteHighScores")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local SoftwareInformation = java_lazy("org.allbinary.logic.system.SoftwareInformation")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local SecondaryThreadPool = java_lazy("org.allbinary.thread.SecondaryThreadPool")
local HighScoresBase = require("org.allbinary.game.score.HighScoresBase")
local HighScores = java_lazy("org.allbinary.game.score.HighScores")
local HighScoresHelper2 = java_lazy("org.allbinary.game.score.HighScoresHelper2")
local HighScoresHelperBaseInterface = java_lazy("org.allbinary.game.score.HighScoresHelperBaseInterface")
local HighScoresResultsListener = java_lazy("org.allbinary.game.score.HighScoresResultsListener")
local LastFetchHighScoresFactory = java_lazy("org.allbinary.game.score.LastFetchHighScoresFactory")
local RecordStoreHighScores = java_lazy("org.allbinary.game.score.RecordStoreHighScores")
local ScoreComparator = java_lazy("org.allbinary.game.score.ScoreComparator")

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

-- class table BasicHighScoresFactory is declared before the requires
BasicHighScoresFactory.__index = BasicHighScoresFactory
BasicHighScoresFactory.className = "BasicHighScoresFactory"
BasicHighScoresFactory.javaClassName = "org.allbinary.game.score.BasicHighScoresFactory"
setmetatable(BasicHighScoresFactory, {__index = HighScoresBase})

function BasicHighScoresFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.abeClientInformation == nil then self.abeClientInformation = nil end
    if self.softwareInformation == nil then self.softwareInformation = nil end
    self.highScoresArray = java_new_array(nil, 2)
    self.TOP = "Top"
    self.SCORES = "Scores"
    self.PERSONAL_HIGH_SCORES = "Personal Top Scores"
    self.WORLD_TOP_SCORES = "World Top Scores"
    self.FETCH = "fetchHighScores"
end


function BasicHighScoresFactory._jinit(self, abeClientInformation, softwareInformation)
    java_super_init(HighScoresBase, self)
    BasicHighScoresFactory._init_fields(self)
        self.abeClientInformation = abeClientInformation
        self.softwareInformation = softwareInformation
    return self
end

function BasicHighScoresFactory.new(...)
    local self = setmetatable({}, BasicHighScoresFactory)
    BasicHighScoresFactory._jinit(self, ...)
    return self
end


function BasicHighScoresFactory:fetchHighScores(gameInfo, highScoresResultsListener)
        self.logUtil:putF("Getting Remote/Local HighScores", self, self.FETCH)
        self:fetchHighScoresPreload(gameInfo, highScoresResultsListener, true)
end
java_overload(BasicHighScoresFactory, "fetchHighScores", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "GameInfo")) and (java_a2 == nil or java_is(java_a2, "HighScoresResultsListener")) end)


function BasicHighScoresFactory:fetchHighScoresPreload(gameInfo, highScoresResultsListener, preload)
        SecondaryThreadPool.getInstance():runTask((function()
            local java_outer_self = self
        local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error, try_value = pcall(function()
                    logUtil:putF(java_outer_self.commonStrings.START, self, self.FETCH)
                    self.highScoresArray[1] = RecordStoreHighScores.getInstance(self.abeClientInformation, gameInfo, self.TOP, self.PERSONAL_HIGH_SCORES, self.SCORES, ScoreComparator.new(true))
                    local gameType = gameInfo:getGameType()
                    local gameTypeFactory = GameTypeFactory.getInstance()
                    local gameInfo2 = gameInfo
                    if rawequal(gameType, gameTypeFactory.SINGLE_PLAYER) or rawequal(gameType, gameTypeFactory.BOT) then
                        gameInfo2 = BasicHighScoresGameInfoFactory.getInstance().SINGLE_PLAYER_SERVER
                    elseif rawequal(gameType, gameTypeFactory.MULTI_PLAYER) then
                        gameInfo2 = BasicHighScoresGameInfoFactory.getInstance().MULTI_PLAYER_SERVER
                    end
                    self.highScoresArray[2] = RemoteHighScores.getInstancePreload(self.abeClientInformation, self.softwareInformation, gameInfo2, self.WORLD_TOP_SCORES, self.SCORES, BooleanFactory.getInstance().FALSE, preload)
                    logUtil:putF(java_outer_self.commonStrings.END, self, self.FETCH)
                    LastFetchHighScoresFactory.getInstance().highScoresArray = self.highScoresArray
                    highScoresResultsListener:setHighScoresArray(self.highScoresArray)
                end)
                if not try_ok then
                    local e = try_error
                    if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                    logUtil:put(self.commonStrings.EXCEPTION, self, self.FETCH, e)
                end
            end
            java_overload(o, "run", 0)
            return o
        end)())
end
java_overload(BasicHighScoresFactory, "fetchHighScoresPreload", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "GameInfo")) and (java_a2 == nil or java_is(java_a2, "HighScoresResultsListener")) and type(java_a3) == "boolean" end)


function BasicHighScoresFactory:createHighScoresHelper()
        return HighScoresHelper2.new()
end
java_overload(BasicHighScoresFactory, "createHighScoresHelper", 0)


function BasicHighScoresFactory.loaded(index2)
        if index2 >= 0 then
            return true
        end
        return false
end

return BasicHighScoresFactory

