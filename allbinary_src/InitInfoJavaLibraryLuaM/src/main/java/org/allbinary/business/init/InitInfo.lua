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

-- local HashMap = require("java.util.HashMap")
local StdUtil = require("org.allbinary.logic.StdUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local LogConfigTypeFactory = require("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = require("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local BooleanUtil = require("org.allbinary.logic.java.bool.BooleanUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InitInfo = {}
InitInfo.__index = InitInfo
InitInfo.className = "InitInfo"

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
        return InitInfo.instance
end


function InitInfo.new()
    local self = setmetatable({}, InitInfo)
    self:_init_fields()
    return self
end


-- throws InitException
function InitInfo:set()
        local try_ok, try_error = pcall(function()
            local initInfoEntity = InitInfoEntity.new()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADER) then
                PreLogUtil.put("created entity", "InitInfo", "set()")
            end
            if not initInfoEntity:is() then
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
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE("error", "InitInfo", "set()", e)
            end
        end
end


-- Java overloaded method: Lua keeps the last definition
function InitInfo:set(hashMap)
        local try_ok, try_error = pcall(function()
            self.testing = hashMap:get(self.TESTING)
            self.mainPath = AbPath.new(hashMap:get(self.MAINPATH), StringUtil.getInstance().EMPTY_STRING)
            self.testHtmlPath = AbPath.new(hashMap:get(self.TESTHTMLPATH), StringUtil.getInstance().EMPTY_STRING)
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE("error", "InitInfo", "set()", e)
            end
        end
end


function InitInfo:get()
        local try_ok, try_error = pcall(function()
            self.testing = nil
            self.mainPath = nil
            self.testHtmlPath = nil
            local initInfoEntity = InitInfoEntity.new()
            initInfoEntity:get()
        end)
        if not try_ok then
            local e = try_error
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
        local try_ok, try_error = pcall(function()
            if not self.hasRead then
                self.hasRead = true
                self:get()
            end
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE("error", "InitInfo", "updateIfNeeded()", e)
            end
            return
        end
end


function InitInfo:isTesting()
        local try_ok, try_error = pcall(function()
            self:updateIfNeeded()
            return BooleanUtil.getInstance():getFromString(self.testing)
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE("error", "InitInfo", "updateIfNeeded()", e)
            end
            return false
        end
end


function InitInfo:getTesting()
        self:updateIfNeeded()
        return self.testing
end


function InitInfo:getTestHtmlPath()
        self:updateIfNeeded()
        if self.testHtmlPath ~= nil then
            return tostring(self.testHtmlPath)
        else
            return nil
        end
end


function InitInfo:getMainPath()
        self:updateIfNeeded()
        if self.mainPath ~= nil then
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

InitInfo.instance = InitInfo.new()

return InitInfo

