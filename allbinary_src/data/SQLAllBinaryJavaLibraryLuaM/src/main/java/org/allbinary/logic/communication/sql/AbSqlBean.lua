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

local AbSqlBean = {}
package.loaded["org.allbinary.logic.communication.sql.AbSqlBean"] = AbSqlBean

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
local HashMap = java_lazy("java.util.HashMap")
-- local Set = require("java.util.Set")
local DbConnectionInfo = java_lazy("org.allbinary.business.init.db.DbConnectionInfo")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local GLOBALS2 = java_lazy("org.allbinary.globals.GLOBALS2")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbSqlRow = require("org.allbinary.logic.communication.sql.AbSqlRow")

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

-- class table AbSqlBean is declared before the requires
AbSqlBean.__index = AbSqlBean
AbSqlBean.className = "AbSqlBean"
AbSqlBean.javaClassName = "org.allbinary.logic.communication.sql.AbSqlBean"
setmetatable(AbSqlBean, {__index = AbSqlRow})

function AbSqlBean:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.METHOD_GET_FIELD = "getField"
    self.METHOD_IS_SUBSET_OF_ENTRY = "isSubsetOfEntry"
end


function AbSqlBean._jinit(self, databaseConnectionInfoInterface)
    java_super_init(AbSqlRow, self, databaseConnectionInfoInterface)
    AbSqlBean._init_fields(self)
        -- super(...) made self above
    return self
end

function AbSqlBean.new(...)
    local self = setmetatable({}, AbSqlBean)
    AbSqlBean._jinit(self, ...)
    return self
end


function AbSqlBean:getField_j3(key, value, requestedField)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT)
        stringBuffer:append(requestedField)
        stringBuffer:append(self.sqlStrings.FROM)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.WHERE)
        stringBuffer:append(key)
        stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
        stringBuffer:append(value)
        stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
        local sqlStatement = tostring(stringBuffer)
        local try_ok, try_error, try_value = pcall(function()
            local field = self.stringUtil.EMPTY_STRING
            local rset = self:executeSQLStatement(sqlStatement)
            while rset:next() do
                field = rset:getString(requestedField)
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    stringBuffer:delete(0, stringBuffer:length())
                    stringBuffer:append(self.sqlStrings.SQL_STATEMENT_LABEL)
                    stringBuffer:append(sqlStatement)
                    stringBuffer:append(self.sqlStrings.FIELD_VALUE)
                    stringBuffer:append(field)
                    self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_GET_FIELD)
                end
                do return "__jreturn", field end
            end
            do return "__jreturn", nil end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement, self, self.METHOD_GET_FIELD, e)
            end
            return tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function AbSqlBean:getField_j2(keysAndValues, requestedField)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT)
        stringBuffer:append(requestedField)
        stringBuffer:append(self.sqlStrings.FROM)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.WHERE)
        local try_ok, try_error, try_value = pcall(function()
            local field = self.stringUtil.EMPTY_STRING
            local set = keysAndValues:keySet()
            local keyArray = set:toArray()
            local size = (keyArray.n or #keyArray)
            local key = nil
            local value = nil
            for i = 0, size - 1 do
                key = keyArray[i + 1]
                value = tostring(keysAndValues:get(key))
                stringBuffer:append(key)
                stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
                stringBuffer:append(value)
                stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                if i < size - 1 then
                    stringBuffer:append(self.sqlStrings.AND)
                end
            end
            local sqlStatement = tostring(stringBuffer)
            local rset = self:executeSQLStatement(sqlStatement)
            while rset:next() do
                field = rset:getString(requestedField)
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    stringBuffer:delete(0, stringBuffer:length())
                    stringBuffer:append(self.sqlStrings.SQL_STATEMENT_LABEL)
                    stringBuffer:append(sqlStatement)
                    stringBuffer:append(self.sqlStrings.FIELD_VALUE)
                    stringBuffer:append(field)
                    self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_GET_FIELD)
                end
                do return "__jreturn", field end
            end
            do return "__jreturn", nil end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local sqlStatement = tostring(stringBuffer)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement, self, self.METHOD_GET_FIELD, e)
            end
            return tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function AbSqlBean:getField(...)
    local count = select("#", ...)
    if count == 3 then return self:getField_j3(...) end
    if count == 2 then return self:getField_j2(...) end
    error("No method getField takes " .. count .. " arguments")
end
AbSqlBean.getField__jdispatcher = AbSqlBean.getField


function AbSqlBean:isSubsetOfEntry(key, value, columnsAndValues)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT)
        local try_ok, try_error, try_value = pcall(function()
            local keyArray = columnsAndValues:keySet():toArray()
            local size = (keyArray.n or #keyArray)
            stringBuffer:append(self.commonSeps.SPACE)
            stringBuffer:append(key)
            for i = 0, size - 1 do
                stringBuffer:append(self.commonSeps.SPACE)
                stringBuffer:append(tostring(keyArray[i + 1]))
            end
            stringBuffer:append(self.sqlStrings.FROM)
            stringBuffer:append(self:getTableName())
            stringBuffer:append(self.sqlStrings.WHERE)
            stringBuffer:append(key)
            stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
            stringBuffer:append(value)
            stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
            local sqlStatement = tostring(stringBuffer)
            local rset = self:executeSQLStatement(sqlStatement)
            local columnName = nil
            local field = nil
            while rset:next() do
                local keyArray2 = columnsAndValues:keySet():toArray()
                local size2 = (keyArray2.n or #keyArray2)
                for i = 0, size2 - 1 do
                    columnName = tostring(keyArray2[i + 1])
                    field = tostring(rset:getObject(columnName))
                    if ((field < columnsAndValues:get(columnName) and -1) or (field > columnsAndValues:get(columnName) and 1) or 0) ~= 0 then
                        do return "__jreturn", GLOBALS2.NOTASUBSET end
                    end
                end
            end
            if rset:getRow() ~= 1 then
                do return "__jreturn", GLOBALS2.NOTASUBSET end
            else
                do return "__jreturn", GLOBALS2.ISASUBSET end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local sqlStatement = tostring(stringBuffer)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement, self, self.METHOD_IS_SUBSET_OF_ENTRY, e)
            end
            return tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AbSqlBean, "isSubsetOfEntry", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or java_is(java_a3, "HashMap")) end)

return AbSqlBean

