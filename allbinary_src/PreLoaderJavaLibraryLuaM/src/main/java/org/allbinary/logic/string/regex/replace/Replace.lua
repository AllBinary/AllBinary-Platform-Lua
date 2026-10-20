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
-- package org.allbinary.logic.string.regex.replace

-- local HashMap = require("java.util.HashMap")
local J2SEUtil = require("org.allbinary.J2SEUtil")
local AppUrlGlobals = require("org.allbinary.globals.AppUrlGlobals")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local LogConfigTypes = require("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local Replace = {}
Replace.__index = Replace
Replace.className = "Replace"

function Replace:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.j2seUtil = J2SEUtil.getInstance()
    self.REPLACERS_ = "Replacers: "
    self.ALL = "all"
    self.FOUND_KEY = "found key total: "
    self.hashMap = nil
end

function Replace.new(...)
    local count = select("#", ...)
    if count == 2 then return Replace._new2(...)
    elseif count == 2 then return Replace._new2(...)
    elseif count == 1 then return Replace._new1(...)
    end
end


function Replace._new2(key, value)
    local self = setmetatable({}, Replace)
    self:_init_fields()
        self.hashMap = StdUtil.getInstance():createHashMap()
        self.hashMap:put({key}, {value})
    return self
end


function Replace._new2(keys, values)
    local self = setmetatable({}, Replace)
    self:_init_fields()
        self.hashMap = StdUtil.getInstance():createHashMap()
        self.hashMap:put(keys, values)
    return self
end


function Replace._new1(hashMap)
    local self = setmetatable({}, Replace)
    self:_init_fields()
        self.hashMap = hashMap
    return self
end


function Replace:all(replace)
        return self:upTo(replace, Integer.MIN_VALUE)
end


function Replace:upTo(replace, total)
        local newStringBuffer = StringMaker.new()
        local totalNumberOfReplaces = 0
        local keys = nil
        local values = nil
        local keyArray = self.j2seUtil:getHashMapAsArray(self.hashMap)
        local size = (keyArray.n or #keyArray)
        for index2 = 0, size - 1 do
            keys = keyArray[index2 + 1]
            values = self.hashMap:get(keys)
            local foundTotal = 0
            local index = 0
            local nextKey = nil
            local end_ = 0
            local nextSecondKey = nil
            local begin2 = 0
            while index < #replace do
                local begin = ((string.find(replace, keys[1], (index) + 1, true) or 0) - 1)
                if begin ~= -1 then
                    foundTotal = foundTotal + 1
                    if math.fmod(foundTotal, 100) == 0 then
                        print(self.FOUND_KEY .. tostring(foundTotal))
                    end
                    nextKey = keys[1]
                    end_ = begin + #nextKey
                    newStringBuffer:delete(0, newStringBuffer:length())
                    newStringBuffer:append(string.sub(replace, (0) + 1, begin))
                    newStringBuffer:append(values[1])
                    index = newStringBuffer:length()
                    newStringBuffer:append(string.sub(replace, (end_) + 1, #replace))
                    replace = tostring(newStringBuffer)
                    if (keys.n or #keys) > 1 then
                        nextSecondKey = keys[2]
                        begin2 = ((string.find(replace, nextSecondKey, (index) + 1, true) or 0) - 1)
                        if begin2 ~= -1 then
                            local end2 = begin2 + #nextSecondKey
                            newStringBuffer:delete(0, newStringBuffer:length())
                            newStringBuffer:append(string.sub(replace, (0) + 1, begin2))
                            newStringBuffer:append(values[2])
                            index = newStringBuffer:length()
                            newStringBuffer:append(string.sub(replace, (end2) + 1, #replace))
                            replace = tostring(newStringBuffer)
                        end
                    end
                    totalNumberOfReplaces = totalNumberOfReplaces + 1
                    if total ~= Integer.MIN_VALUE and totalNumberOfReplaces >= total then
                        break
                    end
                else
                    break
                end
            end
        end
        if totalNumberOfReplaces > 0 then
            if LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().REPLACE) then
                self.logUtil:putF("Total Number Of Replaces: " .. tostring(totalNumberOfReplaces), self, self.ALL)
            end
        end
        return replace
end


function Replace:line(replace)
        local newStringBuffer = StringMaker.new()
        local totalNumberOfReplaces = 0
        local key = nil
        local value = nil
        local keyArray = self.j2seUtil:getHashMapAsArray(self.hashMap)
        local size = (keyArray.n or #keyArray)
        for index2 = 0, size - 1 do
            key = keyArray[index2 + 1]
            value = self.hashMap:get(key)
            local index = 0
            while index < #replace do
                newStringBuffer:delete(0, newStringBuffer:length())
                local begin = ((string.find(replace, key, (index) + 1, true) or 0) - 1)
                if begin ~= -1 then
                    print(self.FOUND_KEY)
                    local end_ = ((string.find(replace, "\n", (begin + #key) + 1, true) or 0) - 1) + 1
                    if end_ >= 0 then
                        newStringBuffer:append(string.sub(replace, (0) + 1, begin))
                        index = newStringBuffer:length()
                        newStringBuffer:append(string.sub(replace, (end_) + 1, #replace))
                        replace = tostring(newStringBuffer)
                        totalNumberOfReplaces = totalNumberOfReplaces + 1
                    end
                else
                    break
                end
            end
        end
        if LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().REPLACE) then
            self.logUtil:putF("Total Number Of Replaces: " .. tostring(totalNumberOfReplaces), self, self.ALL)
        end
        return replace
end


function Replace.main(args)
        local try_ok, try_error = pcall(function()
            local stringUtil = StringUtil.getInstance()
            local appUrlGlobals = AppUrlGlobals.new()
            appUrlGlobals:setWebappPath("G:/mnt/bc/mydev/work/allbinary_src/ToolsJavaLibrary/tools")
            self.URLGLOBALS:init(appUrlGlobals)
            local testString = "\"super gun\" big tank \"goodgunriflegun"
            local replace = Replace.new("gun", "abcdefghijklmnopqrstuxwxyzabcdefghijklmnopqrstuxwxyz")
            print("Old String: " .. testString)
            testString = replace:all(testString)
            print("New String: " .. testString)
            local replaceCat = Replace.new("abcdefghijklmnopqrstuxwxyzabcdefghijklmnopqrstuxwxyz", stringUtil.EMPTY_STRING)
            testString = replaceCat:all(testString)
            print("New String: " .. testString)
        end)
        if not try_ok then
            local e = try_error
        end
end

return Replace

