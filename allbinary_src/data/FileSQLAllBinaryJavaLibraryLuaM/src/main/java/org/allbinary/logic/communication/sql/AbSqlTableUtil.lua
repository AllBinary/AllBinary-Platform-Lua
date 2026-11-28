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

local AbSqlTableUtil = {}
package.loaded["org.allbinary.logic.communication.sql.AbSqlTableUtil"] = AbSqlTableUtil

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
-- local ResultSet = require("java.sql.ResultSet")
-- local ResultSetMetaData = require("java.sql.ResultSetMetaData")
local Calendar = java_lazy("java.util.Calendar")
local Portion = java_lazy("org.allbinary.business.installer.Portion")
local AbFileOutputStream = java_lazy("org.allbinary.logic.io.AbFileOutputStream")
local BufferedLineReader = java_lazy("org.allbinary.logic.io.BufferedLineReader")
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local FileUtil = java_lazy("org.allbinary.logic.io.file.FileUtil")
local Directory = java_lazy("org.allbinary.logic.io.file.directory.Directory")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PATH_GLOBALS = java_lazy("org.allbinary.globals.PATH_GLOBALS")
-- local OutputStream = require("java.io.OutputStream")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbSqlTable = java_lazy("org.allbinary.logic.communication.sql.AbSqlTable")
local SqlStrings = java_lazy("org.allbinary.logic.communication.sql.SqlStrings")

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

-- class table AbSqlTableUtil is declared before the requires
AbSqlTableUtil.__index = AbSqlTableUtil
AbSqlTableUtil.className = "AbSqlTableUtil"
AbSqlTableUtil.javaClassName = "org.allbinary.logic.communication.sql.AbSqlTableUtil"

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

function AbSqlTableUtil._jinit(self)
    AbSqlTableUtil._init_fields(self)
    return self
end

function AbSqlTableUtil.new()
    return AbSqlTableUtil._jinit(setmetatable({}, AbSqlTableUtil))
end


function AbSqlTableUtil.getInstance()
        return AbSqlTableUtil.instance_f
end


function AbSqlTableUtil:getOutputStream(backupPath, tableName)
        local try_ok, try_error, try_value = pcall(function()
            local fileName = require("allbinary_java").to_string(tableName) .. require("allbinary_java").to_string(self.EXTENSION)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(require("allbinary_java").to_string(self.SAVING) .. require("allbinary_java").to_string(tableName), self, self.METHOD_GET_OUTPUT_STREAM)
            end
            local backupFilePath = AbPath.new(backupPath, fileName)
            local backupFile = AbFile.createAbFile(backupFilePath)
            if backupFile:exists() then
                self:backupFile(backupFilePath, backupPath, tableName)
                backupFile:delete()
            end
            backupFile:createNewFile()
            local outputStream = AbFileOutputStream.new(backupFile)
            do return "__jreturn", outputStream end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put("Create File", self, self.METHOD_GET_OUTPUT_STREAM, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function AbSqlTableUtil:backupFile(path, backupPath, tableName)
        local try_ok, try_error, try_value = pcall(function()
            local calendar = Calendar.getInstance()
            local timeLong = calendar:getTimeInMillis()
            local time = tostring(timeLong)
            local stringBuffer = StringMaker.new()
            local fileName = require("allbinary_java").to_string(tableName) .. require("allbinary_java").to_string(self.EXTENSION)
            stringBuffer:append(backupPath)
            stringBuffer:append(AbPathData.getInstance().SEPARATOR)
            stringBuffer:append(time)
            local backupAbPath = AbPath.new(tostring(stringBuffer))
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
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
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.METHOD_BACKUP_FILE, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function AbSqlTableUtil:convertNewLines(value)
        local stringBuffer = StringMaker.new()
        local index = 0
        local lastIndex = 0
        while index < #value do
            index = ((string.find(value, self.specialCharArray[1], (lastIndex) + 1, true) or 0) - 1)
            if not rawequal(index, -1) then
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
        local try_ok, try_error, try_value = pcall(function()
            local count = 0
            local sqlStatement = require("allbinary_java").to_string(self.sqlStrings.SELECT_ALL_FROM) .. require("allbinary_java").to_string(tableName)
            local path = URLGLOBALS.getMainPath() + PATH_GLOBALS.getInstance().BACKUP_PATH
            if not (Directory.create(AbPath.new(path))) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF(require("allbinary_java").to_string(self.ERROR_CREATING) .. require("allbinary_java").to_string(path), self, self.METHOD_BACKUP_TABLE)
                end
            end
            local rset = abSqlTable:executeSQLStatement(sqlStatement)
            local rsmd = rset:getMetaData()
            local colNum = rsmd:getColumnCount()
            local QUERY_START = tostring(require("java.lang.StringBuilder").new():append(self.sqlStrings.INSERT_INTO):append(tableName):append(self.sqlStrings.VALUES))
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
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF(require("allbinary_java").to_string(self.APPENDING) .. require("allbinary_java").to_string(sqlStatementLine), self, self.METHOD_BACKUP_TABLE)
                end
                outputStream:write({string.byte(sqlStatementLine, 1, -1)})
            end
            StreamUtil.getInstance():close(outputStream)
            do return "__jreturn", require("allbinary_java").to_string(require("allbinary_java").to_string(self.TABLE_LABEL) .. require("allbinary_java").to_string(tableName)) .. require("allbinary_java").to_string(self.BACKUP_SUCCESS) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put("Backup Table Failed\nSQL Statement", self, self.METHOD_BACKUP_TABLE, e)
            end
            return require("allbinary_java").to_string(require("allbinary_java").to_string(self.TABLE_LABEL) .. require("allbinary_java").to_string(tableName)) .. require("allbinary_java").to_string(" Backup Failed")
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function AbSqlTableUtil:restoreTable(abSqlTable, portion)
        local tableName = abSqlTable:getTableName()
        local try_ok, try_error, try_value = pcall(function()
            local path = URLGLOBALS.getMainPath() + PATH_GLOBALS.getInstance().BACKUP_PATH
            local current = math.tointeger(portion:getCurrent() // 1)
            if rawequal(current, 0) then
                if Directory.create(AbPath.new(path)) then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                        self.logUtil:putF(require("allbinary_java").to_string(self.ERROR_CREATING) .. require("allbinary_java").to_string(path), self, self.METHOD_RESTORE_TABLE)
                    end
                end
            end
            local backupFile = AbFile.createAbFile(path, require("allbinary_java").to_string(tableName) .. require("allbinary_java").to_string(self.EXTENSION))
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
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_RESTORE_TABLE)
            end
            bufferedLineReader:readUpToLines(start)
            local line = self.stringUtil.EMPTY_STRING
            while bufferedLineReader:getCurrent() < end_ and bufferedLineReader:ready() do
                line = bufferedLineReader:readLine()
                if #line > 1 then
                    abSqlTable:executeSQLStatement(line)
                end
            end
            stringBuffer:append(self.commonSeps.SPACE)
            stringBuffer:append(self.TABLE_LABEL)
            stringBuffer:append(tableName)
            stringBuffer:append(self.PORTION_RESTORED)
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put("Restore Table Failed\nSQL Statement", self, self.METHOD_RESTORE_TABLE, e)
            end
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.TABLE_LABEL)
            stringBuffer:append(tableName)
            stringBuffer:append(" Restoration Failed")
            return tostring(stringBuffer)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

AbSqlTableUtil.instance_f = AbSqlTableUtil.new()

return AbSqlTableUtil

