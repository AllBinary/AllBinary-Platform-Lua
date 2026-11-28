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

local ResourceUtil = {}
package.loaded["org.allbinary.data.resource.ResourceUtil"] = ResourceUtil

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

local InputStream = java_lazy("java.io.InputStream")
local Activity = java_lazy("android.app.Activity")
local Context = java_lazy("android.content.Context")
local Resources = java_lazy("android.content.res.Resources")
local DebugFactory = java_lazy("org.allbinary.debug.DebugFactory")
local NoDebug = java_lazy("org.allbinary.debug.NoDebug")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local HashtableUtil = java_lazy("org.allbinary.util.HashtableUtil")

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

--Android
-- class table ResourceUtil is declared before the requires
ResourceUtil.__index = ResourceUtil
ResourceUtil.className = "ResourceUtil"
ResourceUtil.javaClassName = "org.allbinary.data.resource.ResourceUtil"

function ResourceUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.context = NullUtil.getInstance().NULL_OBJECT
    self.resources = NullUtil.getInstance().NULL_OBJECT
    self.hashMap = StdUtil.getInstance():createHashtable()
end


function ResourceUtil.getInstance()
        return ResourceUtil.instance_f
end


function ResourceUtil._jinit(self)
    ResourceUtil._init_fields(self)
    return self
end

function ResourceUtil.new(...)
    local self = setmetatable({}, ResourceUtil)
    ResourceUtil._jinit(self, ...)
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
        if not rawequal(DebugFactory.getInstance(), NoDebug.getInstance()) then
            PreLogUtil.put(tostring(StringMaker.new():append(resource):append(CommonSeps.getInstance().COLON):append(tostring(value))), self, "getResourceId")
        end
        return value
end


function ResourceUtil:addResource(resource, value)
        if not rawequal(DebugFactory.getInstance(), NoDebug.getInstance()) then
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
            if not rawequal(resource, objectArray[index + 1]) then
                if not rawequal(value, integer) then
                    if rawequal(math.tointeger(value // 1), math.tointeger(integer // 1)) then
                        return true
                    end
                end
            end
            end
        end
        return false
end


function ResourceUtil:setResources(resources)
        self.logUtil:putF(tostring(StringMaker.new():append("Resource Loader: "):append((getmetatable(resources).javaClassName or getmetatable(resources).className))), self, "setResources")
        self.resources = resources
end


-- throws Exception
function ResourceUtil:getResourceAsStream(resource)
        local integer = self.hashMap:get(resource)
        local id = math.tointeger(integer // 1)
        local resources = (self.resources)
        local inputStream = resources:openRawResource(id)
        if not rawequal(inputStream, nil) then
            return inputStream
        end
        return inputStream
end

ResourceUtil.instance_f = ResourceUtil.new()

return ResourceUtil

