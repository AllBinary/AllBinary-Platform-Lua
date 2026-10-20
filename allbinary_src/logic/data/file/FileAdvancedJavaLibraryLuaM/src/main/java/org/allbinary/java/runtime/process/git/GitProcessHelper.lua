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

-- local File = require("java.io.File")
-- local IOException = require("java.io.IOException")
-- local StandardCharsets = require("java.nio.charset.StandardCharsets")
-- local ArrayList = require("java.util.ArrayList")
-- local List = require("java.util.List")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local AbFileNativeUtil = require("org.allbinary.logic.io.file.AbFileNativeUtil")
local TrackedStrings = require("org.allbinary.logic.io.file.directory.TrackedStrings")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

--Do not use this instead just skip target, build, Application paths.
local GitProcessHelper = {}
GitProcessHelper.__index = GitProcessHelper
GitProcessHelper.className = "GitProcessHelper"

function GitProcessHelper:_init_fields()
    self.trackedStrings = TrackedStrings.getInstance()
end


function GitProcessHelper.getInstance()
        return GitProcessHelper.instance
end


function GitProcessHelper.new()
    local self = setmetatable({}, GitProcessHelper)
    self:_init_fields()
        local logUtil = LogUtil.getInstance()
        local commonStrings = CommonStrings.getInstance()
        local THIS_IS_SLOW = "This is slow consider path exclusion instead"
        logUtil:putF(THIS_IS_SLOW, self, commonStrings.CONSTRUCTOR)
    return self
end


-- throws IOException, InterruptedException
function GitProcessHelper:trackedFiles(rootAsString, pathspec)
        return self:trackedFiles(rootAsString, pathspec, ".java")
end


-- throws IOException, InterruptedException
-- Java overloaded method: Lua keeps the last definition
function GitProcessHelper:trackedFiles(rootAsString, pathspec, suffix)
        local process = ProcessBuilder.new(self.trackedStrings.GIT_COMMAND, self.trackedStrings.CHANGE_DIRECTORY_OPTION, rootAsString, self.trackedStrings.LIST_FILES_COMMAND, self.trackedStrings.SEP_BY_NULL_CHAR_INSTEAD_OF_NEW_LINE, self.trackedStrings.PATHSPEC_SEPARATOR, pathspec):redirectError(ProcessBuilder.Redirect.INHERIT):start()
        local output = process:getInputStream():readAllBytes()
        local exitCode = process:waitFor()
        if exitCode ~= 0 then
            error(java_exception("IllegalStateException", tostring(StringMaker.new():append("git ls-files failed for "):append(rootAsString):append(" with exit code "):appendint(exitCode))), 0)
        end
        local files = ArrayList.new()
        local start = 0
        local relativePath = nil
        for index = 0, (output.n or #output) - 1 do
            if output[index + 1] == 0 then
                relativePath = string.char(table.unpack(output, start, index - start, StandardCharsets.UTF_8))
                if (suffix == "" or string.sub(relativePath, -#suffix) == suffix) then
                    files:add(relativePath)
                end
                start = index + 1
            end
        end
        return files
end


function GitProcessHelper:isTracked(file)
        local try_ok, try_error = pcall(function()
            local nativeFile = AbFileNativeUtil.get(file)
            local parentFile = nativeFile:getParentFile()
            local process = ProcessBuilder.new(self.trackedStrings.GIT_COMMAND, self.trackedStrings.CHANGE_DIRECTORY_OPTION, parentFile:getPath(), self.trackedStrings.LIST_FILES_COMMAND, self.trackedStrings.ERROR_UNMATCH_OPTION, self.trackedStrings.PATHSPEC_SEPARATOR, nativeFile:getName()):redirectErrorStream(true):start()
            process:getInputStream():readAllBytes()
            return process:waitFor() == 0
        end)
        if not try_ok then
            local e = try_error
            return false
        end
end

GitProcessHelper.instance = GitProcessHelper.new()

return GitProcessHelper

