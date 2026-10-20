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
-- package org.allbinary.data.resource

-- local InputStream = require("java.io.InputStream")
local Activity = require("android.app.Activity")
local Context = require("android.content.Context")
local Resources = require("android.content.res.Resources")
local DebugFactory = require("org.allbinary.debug.DebugFactory")
local NoDebug = require("org.allbinary.debug.NoDebug")
local NullUtil = require("org.allbinary.logic.NullUtil")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local HashtableUtil = require("org.allbinary.util.HashtableUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--Android
local ResourceUtil = {}
ResourceUtil.__index = ResourceUtil
ResourceUtil.className = "ResourceUtil"

function ResourceUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.context = NullUtil.getInstance().NULL_OBJECT
    self.resources = NullUtil.getInstance().NULL_OBJECT
    self.hashMap = StdUtil.getInstance():createHashtable()
end


function ResourceUtil.getInstance()
        return ResourceUtil.instance
end


function ResourceUtil.new()
    local self = setmetatable({}, ResourceUtil)
    self:_init_fields()
    return self
end


function ResourceUtil:setLoadingPaths(path, ext)
        self.logUtil:putF(CommonStrings.getInstance().NOT_IMPLEMENTED, self, "setLoadingPaths")
end


function ResourceUtil:getContext()
        return self.context
end


function ResourceUtil:setContextFromActivity(activity)
        self.context = activity
end


function ResourceUtil:setContext(aContext)
        self.context = aContext
end


function ResourceUtil:getResourceId(resource)
        local value = self.hashMap:get(resource)
        if DebugFactory.getInstance() ~= NoDebug.getInstance() then
            PreLogUtil.put(tostring(StringMaker.new():append(resource):append(CommonSeps.getInstance().COLON):append(tostring(value))), self, "getResourceId")
        end
        return value
end


function ResourceUtil:addResource(resource, value)
        if DebugFactory.getInstance() ~= NoDebug.getInstance() then
            PreLogUtil.put(tostring(StringMaker.new():append(resource):append(CommonSeps.getInstance().COLON):append(tostring(value))), self, "addResource")
            if self:containsDuplicate(resource, value) then
                ForcedLogUtil.log(tostring(StringMaker.new():append("Found Duplicate Resource: "):append(resource)), self)
            end
        end
        self.hashMap:put(resource, value)
end


function ResourceUtil:containsDuplicate(resource, value)
        local objectArray = HashtableUtil.getInstance():getKeysAsArray(self.hashMap)
        do
            local index = (objectArray.n or #objectArray)
            while (function() index = index - 1 return index end)() >= 0 do
            local integer = self.hashMap:get(objectArray[index + 1])
            if resource ~= objectArray[index + 1] then
                if value ~= integer then
                    if math.tointeger(value // 1) == math.tointeger(integer // 1) then
                        return true
                    end
                end
            end
            end
        end
        return false
end


function ResourceUtil:setResources(resources)
        self.logUtil:putF(tostring(StringMaker.new():append("Resource Loader: "):append(getmetatable(resources).className)), self, "setResources")
        self.resources = resources
end


-- throws Exception
function ResourceUtil:getResourceAsStream(resource)
        local integer = self.hashMap:get(resource)
        local id = math.tointeger(integer // 1)
        local resources = (self.resources)
        local inputStream = resources:openRawResource(id)
        if inputStream ~= nil then
            return inputStream
        end
        return inputStream
end

ResourceUtil.instance = ResourceUtil.new()

return ResourceUtil

