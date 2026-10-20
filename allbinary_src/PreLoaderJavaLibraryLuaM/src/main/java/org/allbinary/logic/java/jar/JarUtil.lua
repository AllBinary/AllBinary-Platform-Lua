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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local JarUtil = {}
JarUtil.__index = JarUtil
JarUtil.className = "JarUtil"

function JarUtil:_init_fields()
    self.jarURL = nil
end


function JarUtil.new(jarURL)
    local self = setmetatable({}, JarUtil)
    self:_init_fields()
        self.jarURL = jarURL
    return self
end


function JarUtil:show()
        local cache = java_new_array(0, 1024)
        local try_ok, try_error = pcall(function()
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
                                local newcache = java_new_array(0, (cache.n or #cache) + 1024)
                                table.move(cache, (0) + 1, (0) + ((cache.n or #cache)), (0) + 1, newcache)
                                cache = newcache
                            end
                        end
                        local tmp = java_new_array(0, offset)
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
            print(ex)
            print(debug.traceback(tostring(ex)))
        end
end


-- throws Exception
function JarUtil.main(args)
        JarUtil.new(URL.new("file:///G:/mnt/bc/mydev/working/j2me/MiniSpaceWars/MiniSpaceWars/dist/MiniSpaceWars.jar")):show()
end

return JarUtil

