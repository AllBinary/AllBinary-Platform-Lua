-- Generated Code Do Not Modify
-- package org.allbinary.logic.communication.sql

local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SqlStrings = {}
SqlStrings.__index = SqlStrings
SqlStrings.className = "SqlStrings"

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
    self.SELECT_ALL_FROM = self.SELECT_ALL .. self.FROM
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

function SqlStrings.new()
    local self = setmetatable({}, SqlStrings)
    self:_init_fields()
    return self
end


function SqlStrings.getInstance()
        return SqlStrings.instance
end

SqlStrings.instance = SqlStrings.new()

return SqlStrings

