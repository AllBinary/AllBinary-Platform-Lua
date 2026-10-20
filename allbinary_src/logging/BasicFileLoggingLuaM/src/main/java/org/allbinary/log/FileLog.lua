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

-- local BufferedReader = require("java.io.BufferedReader")
-- local BufferedWriter = require("java.io.BufferedWriter")
-- local File = require("java.io.File")
-- local FileReader = require("java.io.FileReader")
-- local FileWriter = require("java.io.FileWriter")
-- local RandomAccessFile = require("java.io.RandomAccessFile")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local LogFormatUtil = require("org.allbinary.logic.communication.log.LogFormatUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FileLog = {}
FileLog.__index = FileLog
FileLog.className = "FileLog"


function FileLog.new()
    local self = setmetatable({}, FileLog)
    return self
end


function FileLog.createLogFile()
        local try_ok, try_error = pcall(function()
            FileLog.logFile = File.new(FileLog.logPath, FileLog.fileName)
            if not FileLog.firstTime then
                FileLog.fileOut = BufferedWriter.new(FileWriter.new(FileLog.logFile))
            else
                FileLog.firstTime = false
                local raFile = RandomAccessFile.new(FileLog.logFile, "rw")
                raFile:seek(raFile:length())
                FileLog.fileOut = BufferedWriter.new(FileWriter.new(raFile:getFD()))
            end
            local canWrite = FileLog.logFile:canWrite()
            return canWrite
        end)
        if not try_ok then
            local e = try_error
            print("Error Creating Log: " .. tostring(e))
            return false
        end
end


function FileLog.createLogFileBackup()
        local try_ok, try_error = pcall(function()
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
            while ((function() line = tmpIn:readLine() return line end)()) ~= nil do
                tmpOut:write(line, 0, #line)
                tmpOut:newLine()
            end
            tmpOut:flush()
            tmpOut:close()
            tmpIn:close()
            FileLog.logFile:delete()
            return true
        end)
        if not try_ok then
            local e = try_error
            print("Error Creating Backup: " .. tostring(e))
            return false
        end
end


function FileLog.put(specialMessage, anyType, functionName)
        return FileLog.put(specialMessage, anyType, functionName, nil)
end


-- Java overloaded method: Lua keeps the last definition
function FileLog.put(specialMessage, anyType, functionName, exception)
        local try_ok, try_error = pcall(function()
            if FileLog.firstTime == true then
                FileLog.createLogFileBackup()
                if FileLog.createLogFile() == false then
                    return tostring("Log File Creation Error")
                end
            end
            local length = FileLog.logFile:length()
            if length > FileLog.logLength then
                if not (FileLog.createLogFileBackup()) or FileLog.createLogFile() == false then
                    return tostring("Couldn't Create a Backup file")
                end
            end
            local className = tostring(FileLog.stringUtil.NULL_STRING)
            if functionName == nil then
                functionName = tostring(FileLog.stringUtil.NULL_STRING)
            end
            if specialMessage == nil then
                specialMessage = tostring(FileLog.stringUtil.NULL_STRING)
            end
            if getmetatable(anyType).className ~= nil then
                className = tostring(getmetatable(anyType).className)
            end
            local message = LogFormatUtil.getInstance():get(className, functionName, specialMessage, exception)
            FileLog.fileOut:write(message, 0, #message)
            FileLog.fileOut:newLine()
            FileLog.fileOut:flush()
            return tostring(tostring(FileLog.ORG_ALLBINARY) .. message)
        end)
        if not try_ok then
            local e = try_error
            return tostring("Error: " .. tostring(e))
        end
end


-- Java overloaded method: Lua keeps the last definition
function FileLog.put(specialMessage, className, functionName)
        return FileLog.put(specialMessage, className, functionName, nil)
end


-- Java overloaded method: Lua keeps the last definition
function FileLog.put(specialMessage, className, functionName, exception)
        local try_ok, try_error = pcall(function()
            if FileLog.firstTime == true then
                FileLog.createLogFileBackup()
                if FileLog.createLogFile() == false then
                    return tostring("Log File Creation Error")
                end
            end
            local length = FileLog.logFile:length()
            if length > FileLog.logLength then
                if not (FileLog.createLogFileBackup()) or FileLog.createLogFile() == false then
                    return tostring("Couldn't Create a Backup file")
                end
            end
            if functionName == nil then
                functionName = tostring(FileLog.stringUtil.NULL_STRING)
            end
            if specialMessage == nil then
                specialMessage = tostring(FileLog.stringUtil.NULL_STRING)
            end
            local message = LogFormatUtil.getInstance():get(className, functionName, specialMessage, exception)
            FileLog.fileOut:write(message, 0, #message)
            FileLog.fileOut:newLine()
            FileLog.fileOut:flush()
            return tostring(tostring(FileLog.ORG_ALLBINARY) .. message)
        end)
        if not try_ok then
            local e = try_error
            return tostring("Error: " .. tostring(e))
        end
end


function FileLog.getFilePath()
        return FileLog.logPath + FileLog.fileName
end

FileLog.stringUtil = StringUtil.getInstance()
FileLog.logLength = 33000000
FileLog.logPath = "g:\\log\\"
FileLog.extension = tostring("dat")
FileLog.fileName = tostring("log." .. tostring(FileLog.extension))
FileLog.backupFileName = FileLog.fileName:concat(".bak")
FileLog.ORG_ALLBINARY = "org.allbinary: "
FileLog.firstTime = true
FileLog.logFile = File.new(FileLog.logPath, FileLog.fileName)
FileLog.logFileBak = nil
FileLog.fileOut = nil
FileLog.backupIndex = 0

return FileLog

