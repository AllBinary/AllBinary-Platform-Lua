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
-- package org.allbinary.logic.java.jar

local JarUtil = {}
package.loaded["org.allbinary.logic.java.jar.JarUtil"] = JarUtil

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

-- local IOException = require("java.io.IOException")
-- local URL = require("java.net.URL")
-- local URLConnection = require("java.net.URLConnection")
-- local JarEntry = require("java.util.jar.JarEntry")
-- local JarInputStream = require("java.util.jar.JarInputStream")

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

-- class table JarUtil is declared before the requires
JarUtil.__index = JarUtil
JarUtil.className = "JarUtil"
JarUtil.javaClassName = "org.allbinary.logic.java.jar.JarUtil"

function JarUtil:_init_fields()
    if self.jarURL == nil then self.jarURL = nil end
end


function JarUtil._jinit(self, jarURL)
    JarUtil._init_fields(self)
        self.jarURL = jarURL
    return self
end

function JarUtil.new(...)
    local self = setmetatable({}, JarUtil)
    JarUtil._jinit(self, ...)
    return self
end


function JarUtil:show()
        local cache = java_typed_array("B", java_new_array(0, 1024))
        local try_ok, try_error, try_value = pcall(function()
            local conn = self.jarURL:openConnection()
            local jis = JarInputStream.new(conn:getInputStream())
            while true do
                local entry = jis:getNextJarEntry()
                if entry ~= nil then
                    if not entry:isDirectory() then
                        local offset = 0
                        local i = 0
                        while ((function() i = jis:read(cache, offset, (cache.n or #cache) - offset) return i end)()) ~= -1 do
                            offset = offset + (i)
                            if offset >= (cache.n or #cache) then
                                local newcache = java_typed_array("B", java_new_array(0, (cache.n or #cache) + 1024))
                                table.move(cache, (0) + 1, (0) + ((cache.n or #cache)), (0) + 1, newcache)
                                cache = newcache
                            end
                        end
                        local tmp = java_typed_array("B", java_new_array(0, offset))
                        table.move(cache, (0) + 1, (0) + (offset), (0) + 1, tmp)
                        print(entry:getName())
                    end
                else
                    break
                end
            end
        end)
        if not try_ok then
            local ex = try_error
            if type(ex) ~= "table" then ex = require("java.lang.RuntimeException").new(tostring(ex)) end
            print(ex)
            print(debug.traceback(tostring(ex)))
        end
end


-- throws Exception
function JarUtil.main(args)
        JarUtil.new(URL.new("file:///G:/mnt/bc/mydev/working/j2me/MiniSpaceWars/MiniSpaceWars/dist/MiniSpaceWars.jar")):show()
end

return JarUtil

