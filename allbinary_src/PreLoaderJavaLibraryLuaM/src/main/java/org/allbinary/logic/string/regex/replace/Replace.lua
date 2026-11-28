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

local Replace = {}
package.loaded["org.allbinary.logic.string.regex.replace.Replace"] = Replace

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
local J2SEUtil = java_lazy("org.allbinary.J2SEUtil")
local AppUrlGlobals = java_lazy("org.allbinary.globals.AppUrlGlobals")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table Replace is declared before the requires
Replace.__index = Replace
Replace.className = "Replace"
Replace.javaClassName = "org.allbinary.logic.string.regex.replace.Replace"

function Replace:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.j2seUtil = J2SEUtil.getInstance()
    self.REPLACERS_ = "Replacers: "
    self.ALL = "all"
    self.FOUND_KEY = "found key total: "
    if self.hashMap == nil then self.hashMap = nil end
end

function Replace._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return Replace._new2(self, ...)
    elseif count == 1 then return Replace._new1(self, ...)
    end
    error("No constructor of Replace takes " .. count .. " arguments")
end

function Replace.new(...)
    local self = setmetatable({}, Replace)
    Replace._jinit(self, ...)
    return self
end

function Replace._new2(self, ...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") then return Replace._new2_1(self, ...) end
    return Replace._new2_2(self, ...)
end


function Replace._new2_1(self, key, value)
    Replace._init_fields(self)
        self.hashMap = StdUtil.getInstance():createHashMap()
        self.hashMap:put({key}, {value})
    return self
end


function Replace._new2_2(self, keys, values)
    Replace._init_fields(self)
        self.hashMap = StdUtil.getInstance():createHashMap()
        self.hashMap:put(keys, values)
    return self
end


function Replace._new1(self, hashMap)
    Replace._init_fields(self)
        self.hashMap = hashMap
    return self
end


function Replace:all(replace)
        return self:upTo(replace, require("java.lang.Integer").MIN_VALUE)
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
                if not rawequal(begin, -1) then
                    foundTotal = foundTotal + 1
                    if rawequal(math.fmod(foundTotal, 100), 0) then
                        print(require("allbinary_java").to_string(self.FOUND_KEY) .. require("allbinary_java").to_string(foundTotal))
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
                        if not rawequal(begin2, -1) then
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
                    if not rawequal(total, require("java.lang.Integer").MIN_VALUE) and totalNumberOfReplaces >= total then
                        break
                    end
                else
                    break
                end
            end
        end
        if totalNumberOfReplaces > 0 then
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().REPLACE) then
                self.logUtil:putF(require("allbinary_java").to_string("Total Number Of Replaces: ") .. require("allbinary_java").to_string(totalNumberOfReplaces), self, self.ALL)
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
                if not rawequal(begin, -1) then
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
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().REPLACE) then
            self.logUtil:putF(require("allbinary_java").to_string("Total Number Of Replaces: ") .. require("allbinary_java").to_string(totalNumberOfReplaces), self, self.ALL)
        end
        return replace
end


function Replace.main(args)
        local try_ok, try_error, try_value = pcall(function()
            local stringUtil = StringUtil.getInstance()
            local appUrlGlobals = AppUrlGlobals.new()
            appUrlGlobals:setWebappPath("G:/mnt/bc/mydev/work/allbinary_src/ToolsJavaLibrary/tools")
            URLGLOBALS.init(appUrlGlobals)
            local testString = "\"super gun\" big tank \"goodgunriflegun"
            local replace = Replace.new("gun", "abcdefghijklmnopqrstuxwxyzabcdefghijklmnopqrstuxwxyz")
            print(require("allbinary_java").to_string("Old String: ") .. require("allbinary_java").to_string(testString))
            testString = replace:all(testString)
            print(require("allbinary_java").to_string("New String: ") .. require("allbinary_java").to_string(testString))
            local replaceCat = Replace.new("abcdefghijklmnopqrstuxwxyzabcdefghijklmnopqrstuxwxyz", stringUtil.EMPTY_STRING)
            testString = replaceCat:all(testString)
            print(require("allbinary_java").to_string("New String: ") .. require("allbinary_java").to_string(testString))
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
        end
end

return Replace

