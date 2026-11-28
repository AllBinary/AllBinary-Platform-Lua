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

local AbSqlRow = {}
package.loaded["org.allbinary.logic.communication.sql.AbSqlRow"] = AbSqlRow

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

-- local ResultSet = require("java.sql.ResultSet")
-- local ResultSetMetaData = require("java.sql.ResultSetMetaData")
local HashMap = java_lazy("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local DbConnectionInfo = java_lazy("org.allbinary.business.init.db.DbConnectionInfo")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local Replace = java_lazy("org.allbinary.logic.string.regex.replace.Replace")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbSqlColumn = require("org.allbinary.logic.communication.sql.AbSqlColumn")

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

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table AbSqlRow is declared before the requires
AbSqlRow.__index = AbSqlRow
AbSqlRow.className = "AbSqlRow"
AbSqlRow.javaClassName = "org.allbinary.logic.communication.sql.AbSqlRow"
setmetatable(AbSqlRow, {__index = AbSqlColumn})

function AbSqlRow:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.EQUAL_QUOTE = "=\""
    self.ESCAPE_QUOTES = "\\\""
    self.GET_ROW = "Row Value: "
    self.METHOD_GET_ROW = "getRow()"
    self.METHOD_GET_ROWS = "getRows()"
    self.METHOD_GET_ALL_ROWS = "getAllRows()"
    self.METHOD_UPDATE_WHERE = "updateWhere()"
    self.METHOD_GET_ROWS_WHERE_BETWEEN = "getRowsWhereBetween()"
    self.METHOD_DELETE_WHERE = "deleteWhere()"
    self.ROW_VALUE_LABEL = "Row Value: "
    self.ROW_VALUES_LABEL = "Row Values: "
    self.NO_RESULTS_IN_RESULT_SET = "No Results in ResultSet"
    self.COLUMN_NAME_LABEL = "columnName: "
    self.INSERT_END = "')"
end


function AbSqlRow._jinit(self, databaseConnectionInfoInterface)
    java_super_init(AbSqlColumn, self, databaseConnectionInfoInterface)
    AbSqlRow._init_fields(self)
        -- super(...) made self above
    return self
end

function AbSqlRow.new(...)
    local self = setmetatable({}, AbSqlRow)
    AbSqlRow._jinit(self, ...)
    return self
end


function AbSqlRow:getValue(value)
        if StringValidationUtil.getInstance():isEmpty(value) then
            return self.stringUtil.EMPTY_STRING
        else
            return value
        end
end
java_overload(AbSqlRow, "getValue", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function AbSqlRow:updateWhere_j3(key, value, updatedKeyValuePairs)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.UPDATE)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.SET)
        local try_ok, try_error, try_value = pcall(function()
            local keyArray = updatedKeyValuePairs:keySet():toArray()
            local size = (keyArray.n or #keyArray)
            for i = 0, size - 1 do
                local columnName = tostring(keyArray[i + 1])
                stringBuffer:append(self.commonSeps.SPACE)
                stringBuffer:append(columnName)
                stringBuffer:append(self.EQUAL_QUOTE)
                local columnValue = updatedKeyValuePairs:get(columnName)
                if rawequal(columnValue, nil) then
                    columnValue = self.stringUtil.EMPTY_STRING
                else
                    columnValue = Replace.new(self.sqlStrings.CLOSE_QUOTE, self.ESCAPE_QUOTES):all(columnValue)
                end
                stringBuffer:append(self:getValue(columnValue))
                stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                if i < size - 1 then
                    stringBuffer:append(self.commonSeps.COMMA)
                end
            end
            stringBuffer:append(self.sqlStrings.WHERE)
            stringBuffer:append(key)
            stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
            stringBuffer:append(self:getValue(value))
            stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
            local sqlStatement = tostring(stringBuffer)
            self:executeSQLStatement(sqlStatement)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(require("allbinary_java").to_string(self.SUCCESS_SQL_STATEMENT) .. require("allbinary_java").to_string(sqlStatement), self, self.METHOD_UPDATE_WHERE)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.FAILED_SQL_STATEMENT + stringBuffer, self, self.METHOD_UPDATE_WHERE, e)
            end
        end
end


-- throws Exception
function AbSqlRow:updateWhere_j2(whereKeyValuePairs, updatedKeyValuePairs)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.UPDATE)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.SET)
        local try_ok, try_error, try_value = pcall(function()
            local keyArray = updatedKeyValuePairs:keySet():toArray()
            local size = (keyArray.n or #keyArray)
            for i = 0, size - 1 do
                local columnName = tostring(keyArray[i + 1])
                stringBuffer:append(self.commonSeps.SPACE)
                stringBuffer:append(columnName)
                stringBuffer:append(self.EQUAL_QUOTE)
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF(require("allbinary_java").to_string(self.COLUMN_NAME_LABEL) .. require("allbinary_java").to_string(columnName), self, self.METHOD_UPDATE_WHERE)
                end
                local columnValue = updatedKeyValuePairs:get(columnName)
                if rawequal(columnValue, nil) then
                    columnValue = self.stringUtil.EMPTY_STRING
                else
                    columnValue = Replace.new(self.sqlStrings.CLOSE_QUOTE, self.ESCAPE_QUOTES):all(columnValue)
                end
                stringBuffer:append(self:getValue(columnValue))
                stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                if i < size - 1 then
                    stringBuffer:append(self.commonSeps.COMMA)
                end
            end
            stringBuffer:append(self.sqlStrings.WHERE)
            local set = whereKeyValuePairs:keySet()
            local keyArray2 = set:toArray()
            local size2 = (keyArray2.n or #keyArray2)
            for i = 0, size2 - 1 do
                local key = keyArray2[i + 1]
                local value = whereKeyValuePairs:get(key)
                do
                    stringBuffer:append(key)
                    stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
                    stringBuffer:append(self:getValue(value))
                    stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                    if i < size2 - 1 then
                        stringBuffer:append(self.sqlStrings.AND)
                    end
                end
            end
            local sqlStatement = tostring(stringBuffer)
            self:executeSQLStatement(sqlStatement)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(require("allbinary_java").to_string(self.SUCCESS_SQL_STATEMENT) .. require("allbinary_java").to_string(sqlStatement), self, self.METHOD_UPDATE_WHERE)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.FAILED_SQL_STATEMENT + stringBuffer, self, self.METHOD_UPDATE_WHERE, e)
            end
            error(e, 0)
        end
end
function AbSqlRow:updateWhere(...)
    local count = select("#", ...)
    if count == 3 then return self:updateWhere_j3(...) end
    if count == 2 then return self:updateWhere_j2(...) end
    local parent = getmetatable(AbSqlRow).__index
    if parent.updateWhere then return parent.updateWhere(self, ...) end
    error("No method updateWhere takes " .. count .. " arguments")
end
AbSqlRow.updateWhere__jdispatcher = AbSqlRow.updateWhere


function AbSqlRow:deleteWhere_j2(key, value)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.DELETE)
        stringBuffer:append(self.sqlStrings.FROM)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.WHERE)
        stringBuffer:append(key)
        stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
        stringBuffer:append(value)
        stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
        local try_ok, try_error, try_value = pcall(function()
            local sqlStatement = tostring(stringBuffer)
            self:executeSQLStatement(sqlStatement)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(require("allbinary_java").to_string(self.SUCCESS_SQL_STATEMENT) .. require("allbinary_java").to_string(sqlStatement), self, self.METHOD_DELETE_WHERE)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(require("allbinary_java").to_string(self.FAILED_SQL_STATEMENT) .. require("allbinary_java").to_string(tostring(stringBuffer)), self, self.METHOD_DELETE_WHERE, e)
            end
        end
end


function AbSqlRow:deleteWhere_j1(keysAndValues)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.DELETE)
        stringBuffer:append(self.sqlStrings.FROM)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.WHERE)
        local try_ok, try_error, try_value = pcall(function()
            local set = keysAndValues:keySet()
            local keyArray = set:toArray()
            local size = (keyArray.n or #keyArray)
            for i = 0, size - 1 do
                local key = keyArray[i + 1]
                local value = tostring(keysAndValues:get(key))
                stringBuffer:append(key)
                stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
                stringBuffer:append(self:getValue(value))
                stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                if i < size - 1 then
                    stringBuffer:append(self.sqlStrings.AND)
                end
            end
            local sqlStatement = tostring(stringBuffer)
            self:executeSQLStatement(sqlStatement)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(require("allbinary_java").to_string(self.SUCCESS_SQL_STATEMENT) .. require("allbinary_java").to_string(sqlStatement), self, self.METHOD_DELETE_WHERE)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(require("allbinary_java").to_string(self.FAILED_SQL_STATEMENT) .. require("allbinary_java").to_string(tostring(stringBuffer)), self, self.METHOD_DELETE_WHERE, e)
            end
        end
end
function AbSqlRow:deleteWhere(...)
    local count = select("#", ...)
    if count == 2 then return self:deleteWhere_j2(...) end
    if count == 1 then return self:deleteWhere_j1(...) end
    local parent = getmetatable(AbSqlRow).__index
    if parent.deleteWhere then return parent.deleteWhere(self, ...) end
    error("No method deleteWhere takes " .. count .. " arguments")
end
AbSqlRow.deleteWhere__jdispatcher = AbSqlRow.deleteWhere


function AbSqlRow:insert(values)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.INSERT_INTO)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.VALUES)
        local try_ok, try_error, try_value = pcall(function()
            for i = 0, values:size() - 1 - 1 do
                local value = self:getValue(values:get(i))
                value = Replace.new(self.sqlStrings.ESCAPE, self.sqlStrings.DOUBLE_ESCAPE):all(value)
                stringBuffer:append(value)
                stringBuffer:append(self.sqlStrings.SINGLE_QUOTE_COMMA_SEP)
            end
            local value = self:getValue(values:get(values:size() - 1))
            value = Replace.new(self.sqlStrings.ESCAPE, self.sqlStrings.DOUBLE_ESCAPE):all(value)
            stringBuffer:append(value)
            stringBuffer:append(self.INSERT_END)
            local sqlStatement = tostring(stringBuffer)
            self:executeSQLStatement(sqlStatement)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(require("allbinary_java").to_string(self.SUCCESS_SQL_STATEMENT) .. require("allbinary_java").to_string(sqlStatement), self, self.INSERT)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(require("allbinary_java").to_string(self.FAILED_SQL_STATEMENT) .. require("allbinary_java").to_string(tostring(stringBuffer)), self, self.INSERT, e)
            end
        end
end
java_overload(AbSqlRow, "insert", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function AbSqlRow:getRow(keysAndValues)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT_ALL_FROM)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.WHERE)
        local try_ok, try_error, try_value = pcall(function()
            local result = nil
            local set = keysAndValues:keySet()
            local keyArray = set:toArray()
            local size = (keyArray.n or #keyArray)
            for index = 0, size - 1 do
                local key = keyArray[index + 1]
                local value = tostring(keysAndValues:get(key))
                stringBuffer:append(key)
                stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
                stringBuffer:append(self:getValue(value))
                stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                if index < size - 1 then
                    stringBuffer:append(self.sqlStrings.AND)
                end
            end
            local sqlStatement = tostring(stringBuffer)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(require("allbinary_java").to_string(self.sqlStrings.SQL_STATEMENT_LABEL) .. require("allbinary_java").to_string(sqlStatement), self, self.METHOD_GET_ROW)
            end
            local rset = self:executeSQLStatement(sqlStatement)
            local resultSetMetaData = rset:getMetaData()
            while rset:next() do
                result = self.stdUtil:createHashMap()
                local columnCount = resultSetMetaData:getColumnCount()
                for index = 1, columnCount do
                    local columnName = resultSetMetaData:getColumnName(index)
                    local field = rset:getString(columnName)
                    result:put(columnName, field)
                end
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF(require("allbinary_java").to_string(self.ROW_VALUE_LABEL) .. require("allbinary_java").to_string(tostring(result)), self, self.METHOD_GET_ROW)
                end
                do return "__jreturn", result end
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:putF(self.NO_RESULTS_IN_RESULT_SET, self, self.METHOD_GET_ROW)
            end
            do return "__jreturn", nil end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.FAILED_SQL_STATEMENT + stringBuffer, self, self.METHOD_GET_ROW, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AbSqlRow, "getRow", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HashMap")) end)


function AbSqlRow:getRows_j1(keysAndValues)
        return self:getRows(keysAndValues, StringUtil.getInstance().EMPTY_STRING)
end


function AbSqlRow:getRows_j2(keysAndValues, more)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT_ALL_FROM)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.WHERE)
        local try_ok, try_error, try_value = pcall(function()
            local rows = BasicArrayListD.new()
            local set = keysAndValues:keySet()
            local keyArray = set:toArray()
            local size = (keyArray.n or #keyArray)
            for index = 0, size - 1 do
                local key = keyArray[index + 1]
                local value = tostring(keysAndValues:get(key))
                stringBuffer:append(key)
                stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
                stringBuffer:append(self:getValue(value))
                stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                if index < size - 1 then
                    stringBuffer:append(self.sqlStrings.AND)
                end
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.sqlStrings.SQL_STATEMENT_LABEL + stringBuffer, self, self.METHOD_GET_ROWS)
            end
            stringBuffer:append(more)
            local sqlStatement = tostring(stringBuffer)
            local rset = self:executeSQLStatement(sqlStatement)
            local resultSetMetaData = rset:getMetaData()
            while rset:next() do
                local result = self.stdUtil:createHashMap()
                local columnCount = resultSetMetaData:getColumnCount()
                for index = 1, columnCount do
                    local columnName = resultSetMetaData:getColumnName(index)
                    local field = rset:getString(columnName)
                    result:put(columnName, field)
                end
                local resultAsString = tostring(result)
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF(require("allbinary_java").to_string(self.GET_ROW) .. require("allbinary_java").to_string(resultAsString), self, self.METHOD_GET_ROWS)
                end
                rows:add(result)
            end
            do return "__jreturn", rows end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.FAILED_SQL_STATEMENT + stringBuffer, self, self.METHOD_GET_ROWS, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function AbSqlRow:getRows(...)
    local count = select("#", ...)
    if count == 1 then return self:getRows_j1(...) end
    if count == 2 then return self:getRows_j2(...) end
    local parent = getmetatable(AbSqlRow).__index
    if parent.getRows then return parent.getRows(self, ...) end
    error("No method getRows takes " .. count .. " arguments")
end
AbSqlRow.getRows__jdispatcher = AbSqlRow.getRows


function AbSqlRow:getAllRows()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT_ALL_FROM)
        stringBuffer:append(self:getTableName())
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.sqlStrings.SQL_STATEMENT_LABEL + stringBuffer, self, self.METHOD_GET_ALL_ROWS)
            end
            local rows = BasicArrayListD.new()
            local sqlStatement = tostring(stringBuffer)
            local rset = self:executeSQLStatement(sqlStatement)
            local resultSetMetaData = rset:getMetaData()
            while rset:next() do
                local result = self.stdUtil:createHashMap()
                local columnCount = resultSetMetaData:getColumnCount()
                for index = 1, columnCount do
                    local columnName = resultSetMetaData:getColumnName(index)
                    local field = rset:getString(columnName)
                    result:put(columnName, field)
                end
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF(require("allbinary_java").to_string(self.ROW_VALUES_LABEL) .. require("allbinary_java").to_string(tostring(result)), self, self.METHOD_GET_ALL_ROWS)
                end
                rows:add(result)
            end
            do return "__jreturn", rows end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.FAILED_SQL_STATEMENT + stringBuffer, self, self.METHOD_GET_ALL_ROWS, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AbSqlRow, "getAllRows", 0)


function AbSqlRow:getRowsWhereBetween_j4(whereKeyValuePairs, betweenColumn, smallest, largest)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT_ALL_FROM)
        stringBuffer:append(self:getTableName())
        local try_ok, try_error, try_value = pcall(function()
            local rows = BasicArrayListD.new()
            stringBuffer:append(self.sqlStrings.WHERE)
            local set = whereKeyValuePairs:keySet()
            local key = nil
            local value = nil
            local keyArray = set:toArray()
            local size = (keyArray.n or #keyArray)
            for index = 0, size - 1 do
                key = keyArray[index + 1]
                value = whereKeyValuePairs:get(key)
                stringBuffer:append(key)
                stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
                stringBuffer:append(self:getValue(value))
                stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                stringBuffer:append(self.sqlStrings.AND)
            end
            stringBuffer:append(betweenColumn)
            stringBuffer:append(self.sqlStrings.MORE_THAN_QUOTE)
            stringBuffer:append(smallest)
            stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
            stringBuffer:append(self.sqlStrings.AND)
            stringBuffer:append(betweenColumn)
            stringBuffer:append(self.sqlStrings.LESS_THAN_QUOTE)
            stringBuffer:append(largest)
            stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
            local sqlStatement = tostring(stringBuffer)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(require("allbinary_java").to_string(self.sqlStrings.SQL_STATEMENT_LABEL) .. require("allbinary_java").to_string(sqlStatement), self, self.METHOD_GET_ROWS_WHERE_BETWEEN)
            end
            local rset = self:executeSQLStatement(sqlStatement)
            local resultSetMetaData = rset:getMetaData()
            local result = nil
            local columnNames = nil
            local columnCount = 0
            local columnName = nil
            local field = nil
            while rset:next() do
                result = self.stdUtil:createHashMap()
                columnNames = BasicArrayListD.new()
                columnCount = resultSetMetaData:getColumnCount()
                for index = 1, columnCount do
                    columnName = resultSetMetaData:getColumnName(index)
                    field = rset:getString(columnName)
                    result:put(columnName, field)
                end
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF(require("allbinary_java").to_string(self.ROW_VALUE_LABEL) .. require("allbinary_java").to_string(tostring(result)), self, self.METHOD_GET_ROWS_WHERE_BETWEEN)
                end
                rows:add(result)
            end
            do return "__jreturn", rows end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.FAILED_SQL_STATEMENT + stringBuffer, self, self.METHOD_GET_ROWS_WHERE_BETWEEN, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function AbSqlRow:getRowsWhereBetween_j3(betweenColumn, smallest, largest)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT_ALL_FROM)
        stringBuffer:append(self:getTableName())
        local try_ok, try_error, try_value = pcall(function()
            local rows = BasicArrayListD.new()
            stringBuffer:append(self.sqlStrings.WHERE)
            stringBuffer:append(betweenColumn)
            stringBuffer:append(self.sqlStrings.MORE_THAN_QUOTE)
            stringBuffer:append(smallest)
            stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
            stringBuffer:append(self.sqlStrings.AND)
            stringBuffer:append(betweenColumn)
            stringBuffer:append(self.sqlStrings.LESS_THAN_QUOTE)
            stringBuffer:append(largest)
            stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
            local sqlStatement = tostring(stringBuffer)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(require("allbinary_java").to_string(self.sqlStrings.SQL_STATEMENT_LABEL) .. require("allbinary_java").to_string(sqlStatement), self, self.METHOD_GET_ROWS_WHERE_BETWEEN)
            end
            local rset = self:executeSQLStatement(sqlStatement)
            local resultSetMetaData = rset:getMetaData()
            local columnName = nil
            local field = nil
            local result = nil
            local columnNames = nil
            local columnCount = 0
            while rset:next() do
                result = self.stdUtil:createHashMap()
                columnNames = BasicArrayListD.new()
                columnCount = resultSetMetaData:getColumnCount()
                for index = 1, columnCount do
                    columnName = resultSetMetaData:getColumnName(index)
                    field = rset:getString(columnName)
                    result:put(columnName, field)
                end
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF(require("allbinary_java").to_string(self.ROW_VALUE_LABEL) .. require("allbinary_java").to_string(tostring(result)), self, self.METHOD_GET_ROWS_WHERE_BETWEEN)
                end
                rows:add(result)
            end
            do return "__jreturn", rows end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.FAILED_SQL_STATEMENT + stringBuffer, self, self.METHOD_GET_ROWS_WHERE_BETWEEN, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function AbSqlRow:getRowsWhereBetween(...)
    local count = select("#", ...)
    if count == 4 then return self:getRowsWhereBetween_j4(...) end
    if count == 3 then return self:getRowsWhereBetween_j3(...) end
    local parent = getmetatable(AbSqlRow).__index
    if parent.getRowsWhereBetween then return parent.getRowsWhereBetween(self, ...) end
    error("No method getRowsWhereBetween takes " .. count .. " arguments")
end
AbSqlRow.getRowsWhereBetween__jdispatcher = AbSqlRow.getRowsWhereBetween

return AbSqlRow

