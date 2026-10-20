-- Generated Code Do Not Modify
-- package org.allbinary.logic.communication.sql

local StringMaker = require("org.allbinary.logic.string.StringMaker")
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

local SqlTypeStrings = {}
SqlTypeStrings.__index = SqlTypeStrings
SqlTypeStrings.className = "SqlTypeStrings"

function SqlTypeStrings:_init_fields()
    self.CHAR_COLUMN = "VARCHAR"
    self.INT_COLUMN = "VARCHAR"
    self.MAX_SIZE = "(255)"
    self.SIXTY_SIZE = "(60)"
    self.NOT_NULL = "NOT NULL"
    self.ONE_SIZE = "(1)"
    self.TWO_SIZE = "(2)"
    self.THREE_SIZE = "(3)"
    self.SIX_SIZE = "(6)"
    self.ELEVEN_SIZE = "(11)"
    self.TWELVE_SIZE = "(12)"
    self.ONE_KB_CHAR_COLUMN = tostring(StringMaker.new():append(CommonSeps.getInstance().SPACE):append(self.CHAR_COLUMN):append("(1024)"):append(CommonSeps.getInstance().COMMA_SEP))
    self.MAX_CHAR_COLUMN = tostring(StringMaker.new():append(CommonSeps.getInstance().SPACE):append(self.CHAR_COLUMN):append(self.MAX_SIZE):append(CommonSeps.getInstance().COMMA_SEP))
    self.MAX_CHAR_COLUMN_NOT_NULL = tostring(StringMaker.new():append(CommonSeps.getInstance().SPACE):append(self.CHAR_COLUMN):append(self.MAX_SIZE):append(CommonSeps.getInstance().SPACE):append(self.NOT_NULL):append(CommonSeps.getInstance().COMMA_SEP))
    self.SIXTY_CHAR_COLUMN_NOT_NULL = tostring(StringMaker.new():append(CommonSeps.getInstance().SPACE):append(self.CHAR_COLUMN):append(self.SIXTY_SIZE):append(self.NOT_NULL):append(CommonSeps.getInstance().COMMA_SEP))
    self.ONE_CHAR_COLUMN_NOT_NULL = tostring(StringMaker.new():append(CommonSeps.getInstance().SPACE):append(self.CHAR_COLUMN):append(self.ONE_SIZE):append(self.NOT_NULL):append(CommonSeps.getInstance().COMMA_SEP))
    self.SIX_CHAR_COLUMN_NOT_NULL = tostring(StringMaker.new():append(CommonSeps.getInstance().SPACE):append(self.CHAR_COLUMN):append(self.SIX_SIZE):append(self.NOT_NULL):append(CommonSeps.getInstance().COMMA_SEP))
    self.TWELVE_CHAR_COLUMN_NOT_NULL = tostring(StringMaker.new():append(CommonSeps.getInstance().SPACE):append(self.CHAR_COLUMN):append(self.TWELVE_SIZE):append(self.NOT_NULL):append(CommonSeps.getInstance().COMMA_SEP))
    self.TWO_INT_NOT_NULL = " INT(2) NOT NULL, "
    self.THREE_INT_NOT_NULL = " INT(3) NOT NULL, "
    self.FOUR_INT_NOT_NULL = " INT(4) NOT NULL, "
    self.MAX_INT_NOT_NULL = " INT(11) NOT NULL, "
    self.MAX_INT_UNSIGNED = " INT(11) UNSIGNED, "
    self.MAX_INT_UNSIGNED_NOT_NULL = " INT(11) UNSIGNED NOT NULL, "
    self.MAX_BIG_INT_NOT_NULL = " BIGINT(19) NOT NULL, "
    self.MAX_BIG_INT_UNSIGNED = " BIGINT(19) UNSIGNED, "
    self.MAX_BIG_INT_UNSIGNED_NOT_NULL = " BIGINT(19) UNSIGNED NOT NULL, "
    self.MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL = " BIGINT(19) UNSIGNED AUTO_INCREMENT NOT NULL,"
    self.LONG_BLOB = " LONGBLOB, "
    self.BLOB = " BLOB, "
    self.BLOB_NOT_NULL = " BLOB NOT NULL, "
end

function SqlTypeStrings.new()
    local self = setmetatable({}, SqlTypeStrings)
    self:_init_fields()
    return self
end


function SqlTypeStrings.getInstance()
        return SqlTypeStrings.instance
end

SqlTypeStrings.instance = SqlTypeStrings.new()

return SqlTypeStrings

