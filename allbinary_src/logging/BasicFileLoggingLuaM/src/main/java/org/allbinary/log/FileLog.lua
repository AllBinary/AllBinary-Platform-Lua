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
-- package org.allbinary.log

local FileLog = {}
package.loaded["org.allbinary.log.FileLog"] = FileLog

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

local BufferedReader = java_lazy("java.io.BufferedReader")
-- local BufferedWriter = require("java.io.BufferedWriter")
local File = java_lazy("java.io.File")
-- local FileReader = require("java.io.FileReader")
local FileWriter = java_lazy("java.io.FileWriter")
-- local RandomAccessFile = require("java.io.RandomAccessFile")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local LogFormatUtil = java_lazy("org.allbinary.logic.communication.log.LogFormatUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")

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

-- class table FileLog is declared before the requires
FileLog.__index = FileLog
FileLog.className = "FileLog"
FileLog.javaClassName = "org.allbinary.log.FileLog"


function FileLog._jinit(self)
    return self
end

function FileLog.new(...)
    local self = setmetatable({}, FileLog)
    FileLog._jinit(self, ...)
    return self
end


function FileLog.createLogFile()
        local try_ok, try_error, try_value = pcall(function()
            FileLog.logFile = File.new(FileLog.logPath, FileLog.fileName)
            if not (FileLog.firstTime) then
                FileLog.fileOut = BufferedWriter.new(FileWriter.new(FileLog.logFile))
            else
                FileLog.firstTime = false
                local raFile = RandomAccessFile.new(FileLog.logFile, "rw")
                raFile:seek(raFile:length())
                FileLog.fileOut = BufferedWriter.new(FileWriter.new(raFile:getFD()))
            end
            local canWrite = FileLog.logFile:canWrite()
            do return "__jreturn", canWrite end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            print(require("allbinary_java").to_string("Error Creating Log: ") .. require("allbinary_java").to_string(e))
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function FileLog.createLogFileBackup()
        local try_ok, try_error, try_value = pcall(function()
            local stringMaker = StringMaker.new()
            FileLog.logFileBak = File.new(FileLog.logPath, tostring(stringMaker:append(FileLog.backupFileName):append(CommonSeps.getInstance().PERIOD):appendint(FileLog.backupIndex)))
            while FileLog.logFileBak:isFile() do
                FileLog.backupIndex = FileLog.backupIndex + 1
                stringMaker:delete(0, stringMaker:length())
                FileLog.logFileBak = File.new(FileLog.logPath, tostring(stringMaker:append(FileLog.backupFileName):append(CommonSeps.getInstance().PERIOD):appendint(FileLog.backupIndex)))
            end
            local line = ""
            local tmpOut = BufferedWriter.new(FileWriter.new(FileLog.logFileBak))
            local tmpIn = BufferedReader.new(FileReader.new(FileLog.logFile))
            while tmpIn:ready() do
                line = tmpIn:readLine()
                tmpOut:write(line, 0, #line)
                tmpOut:newLine()
            end
            tmpOut:flush()
            tmpOut:close()
            tmpIn:close()
            FileLog.logFile:delete()
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            print(require("allbinary_java").to_string("Error Creating Backup: ") .. require("allbinary_java").to_string(e))
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function FileLog.put_j3_1(specialMessage, anyType, functionName)
        return FileLog.put(specialMessage, anyType, functionName, nil)
end


function FileLog.put_j4_1(specialMessage, anyType, functionName, exception)
        local try_ok, try_error, try_value = pcall(function()
            if rawequal(FileLog.firstTime, true) then
                FileLog.createLogFileBackup()
                if rawequal(FileLog.createLogFile(), false) then
                    do return "__jreturn", tostring("Log File Creation Error") end
                end
            end
            local length = FileLog.logFile:length()
            if length > FileLog.logLength then
                if not (FileLog.createLogFileBackup()) or rawequal(FileLog.createLogFile(), false) then
                    do return "__jreturn", tostring("Couldn't Create a Backup file") end
                end
            end
            local className = tostring(FileLog.stringUtil.NULL_STRING)
            if rawequal(functionName, nil) then
                functionName = tostring(FileLog.stringUtil.NULL_STRING)
            end
            if rawequal(specialMessage, nil) then
                specialMessage = tostring(FileLog.stringUtil.NULL_STRING)
            end
            if not rawequal((getmetatable(anyType).javaClassName or getmetatable(anyType).className), nil) then
                className = tostring((getmetatable(anyType).javaClassName or getmetatable(anyType).className))
            end
            local message = LogFormatUtil.getInstance():get(className, functionName, specialMessage, exception)
            FileLog.fileOut:write(message, 0, #message)
            FileLog.fileOut:newLine()
            FileLog.fileOut:flush()
            do return "__jreturn", tostring(require("allbinary_java").to_string(FileLog.ORG_ALLBINARY) .. require("allbinary_java").to_string(message)) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            return tostring(require("allbinary_java").to_string("Error: ") .. require("allbinary_java").to_string(e))
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function FileLog.put_j3_2(specialMessage, className, functionName)
        return FileLog.put(specialMessage, className, functionName, nil)
end


function FileLog.put_j4_2(specialMessage, className, functionName, exception)
        local try_ok, try_error, try_value = pcall(function()
            if rawequal(FileLog.firstTime, true) then
                FileLog.createLogFileBackup()
                if rawequal(FileLog.createLogFile(), false) then
                    do return "__jreturn", tostring("Log File Creation Error") end
                end
            end
            local length = FileLog.logFile:length()
            if length > FileLog.logLength then
                if not (FileLog.createLogFileBackup()) or rawequal(FileLog.createLogFile(), false) then
                    do return "__jreturn", tostring("Couldn't Create a Backup file") end
                end
            end
            if rawequal(functionName, nil) then
                functionName = tostring(FileLog.stringUtil.NULL_STRING)
            end
            if rawequal(specialMessage, nil) then
                specialMessage = tostring(FileLog.stringUtil.NULL_STRING)
            end
            local message = LogFormatUtil.getInstance():get(className, functionName, specialMessage, exception)
            FileLog.fileOut:write(message, 0, #message)
            FileLog.fileOut:newLine()
            FileLog.fileOut:flush()
            do return "__jreturn", tostring(require("allbinary_java").to_string(FileLog.ORG_ALLBINARY) .. require("allbinary_java").to_string(message)) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            return tostring(require("allbinary_java").to_string("Error: ") .. require("allbinary_java").to_string(e))
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function FileLog.put(...)
    local count = select("#", ...)
    if count == 3 then return FileLog.put_j3(...) end
    if count == 4 then return FileLog.put_j4(...) end
    error("No method put takes " .. count .. " arguments")
end
FileLog.put__jdispatcher = FileLog.put
function FileLog.put_j3(...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or type(java_a3) == "string") then return FileLog.put_j3_2(...) end
    return FileLog.put_j3_1(...)
end
function FileLog.put_j4(...)
    local java_a1, java_a2, java_a3, java_a4 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or type(java_a3) == "string") and (java_a4 == nil or java_is(java_a4, "Exception")) then return FileLog.put_j4_2(...) end
    return FileLog.put_j4_1(...)
end


function FileLog.getFilePath()
        return FileLog.logPath + FileLog.fileName
end

FileLog.stringUtil = StringUtil.getInstance()
FileLog.logLength = 33000000
FileLog.logPath = "g:\\log\\"
FileLog.extension = tostring("dat")
FileLog.fileName = tostring(require("allbinary_java").to_string("log.") .. require("allbinary_java").to_string(FileLog.extension))
FileLog.backupFileName = FileLog.fileName:concat(".bak")
FileLog.ORG_ALLBINARY = "org.allbinary: "
FileLog.firstTime = true
FileLog.logFile = File.new(FileLog.logPath, FileLog.fileName)
FileLog.logFileBak = nil
FileLog.fileOut = nil
FileLog.backupIndex = 0

return FileLog

