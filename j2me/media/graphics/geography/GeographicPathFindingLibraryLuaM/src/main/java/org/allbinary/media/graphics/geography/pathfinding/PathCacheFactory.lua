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
-- package org.allbinary.media.graphics.geography.pathfinding

local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PathCacheFactory = {}
PathCacheFactory.__index = PathCacheFactory
PathCacheFactory.className = "PathCacheFactory"

function PathCacheFactory:_init_fields()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
    self.hashtable = StdUtil.getInstance():createHashtable()
end


function PathCacheFactory.new()
    local self = setmetatable({}, PathCacheFactory)
    self:_init_fields()
    return self
end


function PathCacheFactory.getInstance()
        return PathCacheFactory.pathFactory
end


function PathCacheFactory:getSize()
        return self.hashtable:size()
end


function PathCacheFactory:add(pathId, list)
        self.hashtable:put(pathId, list)
end


function PathCacheFactory:remove(pathId)
        self.hashtable:remove(pathId)
end


-- throws Exception
function PathCacheFactory:removeAll()
        self.hashtable:clear()
        if self.hashtable:size() > 0 then
            error(java_exception("Exception", "Did not clear"), 0)
        end
end


-- throws Exception
function PathCacheFactory:getOrCreate(pathIdInteger)
        local listCanBeNull = self.hashtable:get(pathIdInteger)
        if listCanBeNull == nil then
            listCanBeNull = self.basicArrayListUtil:getImmutableInstance()
        end
        return listCanBeNull
end

PathCacheFactory.pathFactory = PathCacheFactory.new()

return PathCacheFactory

