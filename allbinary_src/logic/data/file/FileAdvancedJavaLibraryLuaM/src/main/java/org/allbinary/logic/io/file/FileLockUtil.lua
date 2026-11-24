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
-- package org.allbinary.logic.io.file

local FileLockUtil = {}
package.loaded["org.allbinary.logic.io.file.FileLockUtil"] = FileLockUtil

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

-- local FileChannel = require("java.nio.channels.FileChannel")
-- local FileLock = require("java.nio.channels.FileLock")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbFileOutputStream = java_lazy("org.allbinary.logic.io.AbFileOutputStream")
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")

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

-- class table FileLockUtil is declared before the requires
FileLockUtil.__index = FileLockUtil
FileLockUtil.className = "FileLockUtil"
FileLockUtil.javaClassName = "org.allbinary.logic.io.file.FileLockUtil"

function FileLockUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function FileLockUtil.getInstance()
        return FileLockUtil.instance_f
end


function FileLockUtil._jinit(self)
    FileLockUtil._init_fields(self)
    return self
end

function FileLockUtil.new(...)
    local self = setmetatable({}, FileLockUtil)
    FileLockUtil._jinit(self, ...)
    return self
end


-- throws Exception
function FileLockUtil:getAll(vector, isReturnOnFailure)
        local fileLockVector = BasicArrayListD.new()
        local size = vector:size()
        for index = 0, size - 1 do
            local file = vector:get(index)
            local fileLock = self:getLock(file)
            if fileLock ~= nil then
                self.logUtil:putF("File Lock Obtained: " .. tostring(file:getAbsolutePath()), self, "getAll")
                fileLockVector:add(fileLock)
            elseif isReturnOnFailure then
                self.logUtil:putF("Total Locks Obtained: " .. tostring(fileLockVector:size()), self, "getAll")
                return fileLockVector
            end
        end
        self.logUtil:putF("Total Locks Obtained: " .. tostring(fileLockVector:size()), self, "getAll")
        return fileLockVector
end


-- throws Exception
function FileLockUtil:getAllPossible(vector)
        return self:getAll(vector, false)
end


-- throws Exception
function FileLockUtil:getAllOrNone(vector)
        local fileLockVector = self:getAll(vector, true)
        if vector:size() ~= fileLockVector:size() then
            return BasicArrayListD.new()
        else
            return fileLockVector
        end
end


-- throws Exception
function FileLockUtil:getLock_j1_1(file)
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self:getLock(AbFileOutputStream.createFromAbFileAppend(file, true)) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Exception returns null", self, "getLock", e)
            return nil
        end
        do -- finally
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function FileLockUtil:getLock_j1_2(fileOutputStream)
        local try_ok, try_error, try_value = pcall(function()
            local fileLock = self:getLock(fileOutputStream:getChannel())
            do return "__jreturn", fileLock end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Exception returns null", self, "getLock", e)
            return nil
        end
        do -- finally
            self.logUtil:putF("Finally - Closing FileOutputStream", self, "getLock")
            StreamUtil.getInstance():close(fileOutputStream)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function FileLockUtil:getLock_j1_3(fileChannel)
        local try_ok, try_error, try_value = pcall(function()
            local fileLock = fileChannel:tryLock()
            do return "__jreturn", fileLock end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Exception returns null", self, "getLock", e)
            return nil
        end
        do -- finally
            self.logUtil:putF("Finally - Closing FileChannel", self, "getLock")
            fileChannel:close()
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function FileLockUtil:getLock(...)
    local count = select("#", ...)
    if count == 1 then return self:getLock_j1(...) end
    error("No method getLock takes " .. count .. " arguments")
end
FileLockUtil.getLock__jdispatcher = FileLockUtil.getLock
function FileLockUtil:getLock_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "AbFile")) then return FileLockUtil.getLock_j1_1(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "AbFileOutputStream")) then return FileLockUtil.getLock_j1_2(self, ...) end
    return FileLockUtil.getLock_j1_3(self, ...)
end

FileLockUtil.instance_f = FileLockUtil.new()

return FileLockUtil

