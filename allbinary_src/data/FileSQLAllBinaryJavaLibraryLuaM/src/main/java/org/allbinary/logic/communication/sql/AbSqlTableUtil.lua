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
-- package org.allbinary.logic.communication.sql

local StringMaker = require("org.allbinary.logic.string.StringMaker")
-- local ResultSet = require("java.sql.ResultSet")
-- local ResultSetMetaData = require("java.sql.ResultSetMetaData")
-- local Calendar = require("java.util.Calendar")
local Portion = require("org.allbinary.business.installer.Portion")
local AbFileOutputStream = require("org.allbinary.logic.io.AbFileOutputStream")
local BufferedLineReader = require("org.allbinary.logic.io.BufferedLineReader")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FileUtil = require("org.allbinary.logic.io.file.FileUtil")
local Directory = require("org.allbinary.logic.io.file.directory.Directory")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PATH_GLOBALS = require("org.allbinary.globals.PATH_GLOBALS")
-- local OutputStream = require("java.io.OutputStream")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbSqlTableUtil = {}
AbSqlTableUtil.__index = AbSqlTableUtil
AbSqlTableUtil.className = "AbSqlTableUtil"

function AbSqlTableUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.EXTENSION = ".adb"
    self.END = "')\n"
    self.SAVING_BACKUP_PATH = "Saving Backup: Path: "
    self.FILE_LABEL = " File: "
    self.METHOD_RESTORE_TABLE = "restoreTable()"
    self.METHOD_BACKUP_TABLE = "backupTable()"
    self.METHOD_BACKUP_FILE = "backupFile()"
    self.METHOD_GET_OUTPUT_STREAM = "getOutputStream()"
    self.TABLE_CREATION_SUCCESS = "Table Creation Successful: "
    self.DROPPED_SUCCESS = " Dropped Successfully"
    self.SAVING = "Saving: "
    self.APPENDING = "Appending: "
    self.TABLE_LABEL = "Table: "
    self.BACKUP_SUCCESS = " Backup Success"
    self.ERROR_CREATING = "Error Creating: "
    self.TOTAL_LABEL = " Total: "
    self.SECTION_LABEL = " Section: "
    self.DASH = " - "
    self.PORTION_RESTORED = " Portion Restored"
    self.specialCharArray = {"\n", "\f", "\r"}
    self.NEW_LINE = "\\n"
    self.stringUtil = StringUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.sqlStrings = SqlStrings.getInstance()
end

function AbSqlTableUtil.new()
    local self = setmetatable({}, AbSqlTableUtil)
    self:_init_fields()
    return self
end


function AbSqlTableUtil.getInstance()
        return AbSqlTableUtil.instance
end


function AbSqlTableUtil:getOutputStream(backupPath, tableName)
        local try_ok, try_error = pcall(function()
            local fileName = tableName .. self.EXTENSION
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.SAVING .. tableName, self, self.METHOD_GET_OUTPUT_STREAM)
            end
            local backupFilePath = AbPath.new(backupPath, fileName)
            local backupFile = AbFile.createAbFile(backupFilePath)
            if backupFile:exists() then
                self:backupFile(backupFilePath, backupPath, tableName)
                backupFile:delete()
            end
            backupFile:createNewFile()
            local outputStream = AbFileOutputStream.new(backupFile)
            return outputStream
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put("Create File", self, self.METHOD_GET_OUTPUT_STREAM, e)
            end
            return nil
        end
end


function AbSqlTableUtil:backupFile(path, backupPath, tableName)
        local try_ok, try_error = pcall(function()
            local calendar = Calendar.getInstance()
            local timeLong = calendar:getTimeInMillis()
            local time = tostring(timeLong)
            local stringBuffer = StringMaker.new()
            local fileName = tableName .. self.EXTENSION
            stringBuffer:append(backupPath)
            stringBuffer:append(AbPathData.getInstance().SEPARATOR)
            stringBuffer:append(time)
            local backupAbPath = AbPath.new(tostring(stringBuffer))
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(self.SAVING_BACKUP_PATH)
                stringBuffer:append(backupAbPath:toFileSystemString())
                stringBuffer:append(self.FILE_LABEL)
                stringBuffer:append(fileName)
                self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_BACKUP_FILE)
            end
            Directory.create(backupAbPath)
            local backupFileBak = AbFile.createAbFile(backupAbPath:toFileSystemString())
            backupFileBak:createNewFile()
            FileUtil.getInstance():copy(path, backupAbPath)
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.METHOD_BACKUP_FILE, e)
            end
            return false
        end
end


function AbSqlTableUtil:convertNewLines(value)
        local stringBuffer = StringMaker.new()
        local index = 0
        local lastIndex = 0
        while index < #value do
            index = ((string.find(value, self.specialCharArray[1], (lastIndex) + 1, true) or 0) - 1)
            if index ~= -1 then
                local nextLine = string.sub(value, (lastIndex) + 1, index - 1)
                stringBuffer:append(nextLine)
                stringBuffer:append(self.NEW_LINE)
                lastIndex = index + 1
            else
                break
            end
        end
        if lastIndex < #value then
            stringBuffer:append(string.sub(value, (lastIndex) + 1, #value))
        end
        return tostring(stringBuffer)
end


function AbSqlTableUtil:backupTable(abSqlTable)
        local tableName = abSqlTable:getTableName()
        local try_ok, try_error = pcall(function()
            local count = 0
            local sqlStatement = tostring(self.sqlStrings.SELECT_ALL_FROM) .. tableName
            local path = org.allbinary.globals.URLGLOBALS:getMainPath() + self.PATH_GLOBALS:getInstance().BACKUP_PATH
            if not Directory.create(AbPath.new(path)) then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.ERROR_CREATING .. tostring(path), self, self.METHOD_BACKUP_TABLE)
                end
            end
            local rset = abSqlTable:executeSQLStatement(sqlStatement)
            local rsmd = rset:getMetaData()
            local colNum = rsmd:getColumnCount()
            local QUERY_START = tostring(StringBuilder.new():append(self.sqlStrings.INSERT_INTO):append(tableName):append(self.sqlStrings.VALUES))
            local stringBuffer = StringMaker.new()
            local outputStream = self:getOutputStream(path, tableName)
            while rset:next() do
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(QUERY_START)
                for i = 1, colNum - 1 do
                    local value = rset:getString(i)
                    stringBuffer:append(self:convertNewLines(value))
                    stringBuffer:append(self.sqlStrings.SINGLE_QUOTE_COMMA_SEP)
                end
                stringBuffer:append(rset:getString(colNum))
                stringBuffer:append(self.END)
                local sqlStatementLine = tostring(stringBuffer)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.APPENDING .. sqlStatementLine, self, self.METHOD_BACKUP_TABLE)
                end
                outputStream:write({string.byte(sqlStatementLine, 1, -1)})
            end
            StreamUtil.getInstance():close(outputStream)
            return self.TABLE_LABEL .. tableName .. self.BACKUP_SUCCESS
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put("Backup Table Failed\nSQL Statement", self, self.METHOD_BACKUP_TABLE, e)
            end
            return self.TABLE_LABEL .. tableName .. " Backup Failed"
        end
end


function AbSqlTableUtil:restoreTable(abSqlTable, portion)
        local tableName = abSqlTable:getTableName()
        local try_ok, try_error = pcall(function()
            local path = org.allbinary.globals.URLGLOBALS:getMainPath() + self.PATH_GLOBALS:getInstance().BACKUP_PATH
            local current = math.tointeger(portion:getCurrent() // 1)
            if current == 0 then
                if Directory.create(AbPath.new(path)) then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                        self.logUtil:putF(self.ERROR_CREATING .. tostring(path), self, self.METHOD_RESTORE_TABLE)
                    end
                end
            end
            local backupFile = AbFile.createAbFile(path, tableName .. self.EXTENSION)
            local bufferedLineReader = BufferedLineReader.new(backupFile)
            local size = bufferedLineReader:getSize()
            local section = size / math.tointeger(portion:getTotal() // 1) + 1
            local start = section * current
            local end_ = start + section
            if end_ > size then
                end_ = size
            end
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.TOTAL_LABEL)
            stringBuffer:append(size)
            stringBuffer:append(self.SECTION_LABEL)
            stringBuffer:append(start)
            stringBuffer:append(self.DASH)
            stringBuffer:append(end_)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_RESTORE_TABLE)
            end
            bufferedLineReader:readUpToLines(start)
            local line = self.stringUtil.EMPTY_STRING
            while bufferedLineReader:getCurrent() < end_ and ((function() line = bufferedLineReader:readLine() return line end)()) ~= nil do
                if #line > 1 then
                    abSqlTable:executeSQLStatement(line)
                end
            end
            stringBuffer:append(self.commonSeps.SPACE)
            stringBuffer:append(self.TABLE_LABEL)
            stringBuffer:append(tableName)
            stringBuffer:append(self.PORTION_RESTORED)
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put("Restore Table Failed\nSQL Statement", self, self.METHOD_RESTORE_TABLE, e)
            end
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.TABLE_LABEL)
            stringBuffer:append(tableName)
            stringBuffer:append(" Restoration Failed")
            return tostring(stringBuffer)
        end
end

AbSqlTableUtil.instance = AbSqlTableUtil.new()

return AbSqlTableUtil

