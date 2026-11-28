-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2026 AllBinary 
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
-- package org.allbinary.java.runtime.process.git

local GitProcessHelper = {}
package.loaded["org.allbinary.java.runtime.process.git.GitProcessHelper"] = GitProcessHelper

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

local File = java_lazy("java.io.File")
-- local IOException = require("java.io.IOException")
-- local StandardCharsets = require("java.nio.charset.StandardCharsets")
local ArrayList = java_lazy("java.util.ArrayList")
-- local List = require("java.util.List")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local AbFileNativeUtil = java_lazy("org.allbinary.logic.io.file.AbFileNativeUtil")
local TrackedStrings = java_lazy("org.allbinary.logic.io.file.directory.TrackedStrings")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

--Do not use this instead just skip target, build, Application paths.
-- class table GitProcessHelper is declared before the requires
GitProcessHelper.__index = GitProcessHelper
GitProcessHelper.className = "GitProcessHelper"
GitProcessHelper.javaClassName = "org.allbinary.java.runtime.process.git.GitProcessHelper"

function GitProcessHelper:_init_fields()
    self.trackedStrings = TrackedStrings.getInstance()
end


function GitProcessHelper.getInstance()
        return GitProcessHelper.instance_f
end


function GitProcessHelper._jinit(self)
    GitProcessHelper._init_fields(self)
        local logUtil = LogUtil.getInstance()
        local commonStrings = CommonStrings.getInstance()
        local THIS_IS_SLOW = "This is slow consider path exclusion instead"
        logUtil:putF(THIS_IS_SLOW, self, commonStrings.CONSTRUCTOR)
    return self
end

function GitProcessHelper.new(...)
    local self = setmetatable({}, GitProcessHelper)
    GitProcessHelper._jinit(self, ...)
    return self
end


-- throws IOException, InterruptedException
function GitProcessHelper:trackedFiles_j2(rootAsString, pathspec)
        return self:trackedFiles(rootAsString, pathspec, ".java")
end


-- throws IOException, InterruptedException
function GitProcessHelper:trackedFiles_j3(rootAsString, pathspec, suffix)
        local process = ProcessBuilder.new(self.trackedStrings.GIT_COMMAND, self.trackedStrings.CHANGE_DIRECTORY_OPTION, rootAsString, self.trackedStrings.LIST_FILES_COMMAND, self.trackedStrings.SEP_BY_NULL_CHAR_INSTEAD_OF_NEW_LINE, self.trackedStrings.PATHSPEC_SEPARATOR, pathspec):redirectError(ProcessBuilder.Redirect.INHERIT):start()
        local output = process:getInputStream():readAllBytes()
        local exitCode = process:waitFor()
        if not rawequal(exitCode, 0) then
            error(require("java.lang.IllegalStateException").new(tostring(StringMaker.new():append("git ls-files failed for "):append(rootAsString):append(" with exit code "):appendint(exitCode))), 0)
        end
        local files = ArrayList.new()
        local start = 0
        local relativePath = nil
        for index = 0, (output.n or #output) - 1 do
            if rawequal(output[index + 1], 0) then
                relativePath = string.char(table.unpack(output, start, index - start, StandardCharsets.UTF_8))
                if (suffix == "" or string.sub(relativePath, -#suffix) == suffix) then
                    files:add(relativePath)
                end
                start = index + 1
            end
        end
        return files
end
function GitProcessHelper:trackedFiles(...)
    local count = select("#", ...)
    if count == 2 then return self:trackedFiles_j2(...) end
    if count == 3 then return self:trackedFiles_j3(...) end
    error("No method trackedFiles takes " .. count .. " arguments")
end
GitProcessHelper.trackedFiles__jdispatcher = GitProcessHelper.trackedFiles


function GitProcessHelper:isTracked(file)
        local try_ok, try_error, try_value = pcall(function()
            local nativeFile = AbFileNativeUtil.get(file)
            local parentFile = nativeFile:getParentFile()
            local process = ProcessBuilder.new(self.trackedStrings.GIT_COMMAND, self.trackedStrings.CHANGE_DIRECTORY_OPTION, parentFile:getPath(), self.trackedStrings.LIST_FILES_COMMAND, self.trackedStrings.ERROR_UNMATCH_OPTION, self.trackedStrings.PATHSPEC_SEPARATOR, nativeFile:getName()):redirectErrorStream(true):start()
            process:getInputStream():readAllBytes()
            do return "__jreturn", rawequal(process:waitFor(), 0) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

GitProcessHelper.instance_f = GitProcessHelper.new()

return GitProcessHelper

