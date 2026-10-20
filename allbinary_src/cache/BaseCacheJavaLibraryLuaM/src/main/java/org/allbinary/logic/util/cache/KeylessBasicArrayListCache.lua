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
-- package org.allbinary.logic.util.cache

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local IndexedBasicArrayListCache = require("org.allbinary.logic.util.cache.IndexedBasicArrayListCache")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local KeylessBasicArrayListCache = {}
KeylessBasicArrayListCache.__index = KeylessBasicArrayListCache
KeylessBasicArrayListCache.className = "KeylessBasicArrayListCache"
setmetatable(KeylessBasicArrayListCache, {__index = IndexedBasicArrayListCache})

function KeylessBasicArrayListCache:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
end


function KeylessBasicArrayListCache.new()
    local self = setmetatable(IndexedBasicArrayListCache.new(), KeylessBasicArrayListCache)
    self:_init_fields()
    return self
end


function KeylessBasicArrayListCache:get()
        local try_ok, try_error = pcall(function()
            if self.index >= self.list:size() then
                self:addDefault()
            end
            local list = self:getAt((function() local value = self.index self.index = value + 1 return value end)())
            return list
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.GET, e)
            return self.basicArrayListUtil:getImmutableInstance()
        end
end


function KeylessBasicArrayListCache:clear()
        IndexedBasicArrayListCache.clear(self)
        local basicArrayList = nil
        for index = self.list:size() - 1, 0, -1 do
            basicArrayList = (self.list.objectArray[index + 1])
            basicArrayList:clear()
        end
end


function KeylessBasicArrayListCache:log()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("S: ")
        stringBuffer:appendint(self.list:size())
        local S_LABEL = " s: "
        local basicArrayList = nil
        for index = self.list:size() - 1, 0, -1 do
            stringBuffer:append(S_LABEL)
            basicArrayList = (self.list.objectArray[index + 1])
            stringBuffer:appendint(basicArrayList:size())
        end
        return tostring(stringBuffer)
end

return KeylessBasicArrayListCache

