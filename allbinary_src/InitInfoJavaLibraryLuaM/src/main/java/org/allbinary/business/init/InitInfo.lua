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
-- package org.allbinary.business.init

local InitInfo = {}
package.loaded["org.allbinary.business.init.InitInfo"] = InitInfo

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

local HashMap = java_lazy("java.util.HashMap")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local BooleanUtil = java_lazy("org.allbinary.logic.java.bool.BooleanUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local InitException = java_lazy("org.allbinary.business.init.InitException")
local InitInfoEntity = java_lazy("org.allbinary.business.init.InitInfoEntity")

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

-- class table InitInfo is declared before the requires
InitInfo.__index = InitInfo
InitInfo.className = "InitInfo"
InitInfo.javaClassName = "org.allbinary.business.init.InitInfo"

function InitInfo:_init_fields()
    self.TESTING = "TESTING"
    self.MAINPATH = "MAINPATH"
    self.TESTHTMLPATH = "TESTHTMLPATH"
    self.testing = nil
    self.mainPath = nil
    self.testHtmlPath = nil
    self.hasRead = false
end


function InitInfo.getInstance()
        return InitInfo.instance_f
end


function InitInfo._jinit(self)
    InitInfo._init_fields(self)
    return self
end

function InitInfo.new(...)
    local self = setmetatable({}, InitInfo)
    InitInfo._jinit(self, ...)
    return self
end


-- throws InitException
function InitInfo:set_j0()
        local try_ok, try_error, try_value = pcall(function()
            local initInfoEntity = InitInfoEntity.new()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADER) then
                PreLogUtil.put("created entity", "InitInfo", "set()")
            end
            if not (initInfoEntity:is()) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADER) then
                    PreLogUtil.put("adding", "InitInfo", "set()")
                end
                initInfoEntity:add()
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADER) then
                    PreLogUtil.put("update", "InitInfo", "set()")
                end
                initInfoEntity:update()
            end
            self.hasRead = false
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE("error", "InitInfo", "set()", e)
            end
        end
end


function InitInfo:set_j1(hashMap)
        local try_ok, try_error, try_value = pcall(function()
            self.testing = hashMap:get(self.TESTING)
            self.mainPath = AbPath.new(hashMap:get(self.MAINPATH), StringUtil.getInstance().EMPTY_STRING)
            self.testHtmlPath = AbPath.new(hashMap:get(self.TESTHTMLPATH), StringUtil.getInstance().EMPTY_STRING)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE("error", "InitInfo", "set()", e)
            end
        end
end
function InitInfo:set(...)
    local count = select("#", ...)
    if count == 0 then return self:set_j0(...) end
    if count == 1 then return self:set_j1(...) end
    error("No method set takes " .. count .. " arguments")
end
InitInfo.set__jdispatcher = InitInfo.set


function InitInfo:get()
        local try_ok, try_error, try_value = pcall(function()
            self.testing = nil
            self.mainPath = nil
            self.testHtmlPath = nil
            local initInfoEntity = InitInfoEntity.new()
            initInfoEntity:get()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE("error", "InitInfo", "set()", e)
            end
            return
        end
end


function InitInfo:setHasRead(value)
        self.hasRead = value
end


function InitInfo:updateIfNeeded()
        local try_ok, try_error, try_value = pcall(function()
            if not (self.hasRead) then
                self.hasRead = true
                self:get()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE("error", "InitInfo", "updateIfNeeded()", e)
            end
            return
        end
end


function InitInfo:isTesting()
        local try_ok, try_error, try_value = pcall(function()
            self:updateIfNeeded()
            do return "__jreturn", BooleanUtil.getInstance():getFromString(self.testing) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE("error", "InitInfo", "updateIfNeeded()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function InitInfo:getTesting()
        self:updateIfNeeded()
        return self.testing
end


function InitInfo:getTestHtmlPath()
        self:updateIfNeeded()
        if not rawequal(self.testHtmlPath, nil) then
            return tostring(self.testHtmlPath)
        else
            return nil
        end
end


function InitInfo:getMainPath()
        self:updateIfNeeded()
        if not rawequal(self.mainPath, nil) then
            return tostring(self.mainPath)
        else
            return nil
        end
end


function InitInfo:setTesting(value)
        self.testing = value
end


function InitInfo:setTestHtmlPath(value)
        self.testHtmlPath = value
end


function InitInfo:setMainPath(value)
        self.mainPath = value
end


function InitInfo:isMainPathValid(abPath)
        return true
end


function InitInfo:isTestHtmlPathValid(abPath)
        return true
end


-- throws Exception
function InitInfo:isTestingValid(testing)
        return BooleanUtil.getInstance():isStringBoolean(testing)
end


function InitInfo:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(self.TESTING, self:getTesting())
        hashMap:put(self.MAINPATH, self:getMainPath())
        hashMap:put(self.TESTHTMLPATH, self:getTestHtmlPath())
        return hashMap
end

InitInfo.instance_f = InitInfo.new()

return InitInfo

