-- Generated Code Do Not Modify
-- package org.allbinary.logic.communication.sql

local SqlStrings = {}
package.loaded["org.allbinary.logic.communication.sql.SqlStrings"] = SqlStrings

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

local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")

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

-- class table SqlStrings is declared before the requires
SqlStrings.__index = SqlStrings
SqlStrings.className = "SqlStrings"
SqlStrings.javaClassName = "org.allbinary.logic.communication.sql.SqlStrings"

function SqlStrings:_init_fields()
    self.CREATE_DATABASE = "CREATE DATABASE "
    self.DROP_TABLE = "DROP TABLE "
    self.CREATE_TABLE = "CREATE TABLE "
    self.START = " ("
    self.SELECT = "SELECT "
    self.FROM = " FROM "
    self.SELECT_ALL = "SELECT *"
    self.WHERE = " WHERE "
    self.AND = " AND "
    self.UPDATE = "UPDATE "
    self.SET = " SET "
    self.SELECT_ALL_FROM = require("allbinary_java").to_string(self.SELECT_ALL) .. require("allbinary_java").to_string(self.FROM)
    self.DELETE = "DELETE"
    self.LIKE_QUOTE = " LIKE \""
    self.INSERT_INTO = "INSERT INTO "
    self.VALUES = " VALUES ('"
    self.ORDER_BY = "ORDER BY"
    self.COUNT = "COUNT("
    self.ASC = "ASC"
    self.DESC = "DESC"
    self.PRIMARY_KEY = "PRIMARY KEY("
    self.END = ") )"
    self.EQUAL_QUOTE = " = \""
    self.CLOSE_QUOTE = CommonSeps.getInstance().QUOTE
    self.EQUAL_QUOTE_NO_SPACE = "=\""
    self.ESCAPE = "\\"
    self.DOUBLE_ESCAPE = "\\\\"
    self.MORE_THAN_QUOTE = " > \""
    self.LESS_THAN_QUOTE = " < \""
    self.SINGLE_QUOTE_COMMA_SEP = "','"
    self.ID = "ID"
    self.SQL_STATEMENT_LABEL = "SQL Statement: "
    self.COLUMN_VALUE = "\nColumn Value: "
    self.CREATE_RETURN = " Created Successfully"
    self.FIELD_VALUE = "\nField Value: "
end

function SqlStrings._jinit(self)
    SqlStrings._init_fields(self)
    return self
end

function SqlStrings.new()
    return SqlStrings._jinit(setmetatable({}, SqlStrings))
end


function SqlStrings.getInstance()
        return SqlStrings.instance_f
end

SqlStrings.instance_f = SqlStrings.new()

return SqlStrings

