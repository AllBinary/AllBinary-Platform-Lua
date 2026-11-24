-- Generated Code Do Not Modify
-- package org.allbinary.logic.communication.sql

local SqlTypeStrings = {}
package.loaded["org.allbinary.logic.communication.sql.SqlTypeStrings"] = SqlTypeStrings

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

-- class table SqlTypeStrings is declared before the requires
SqlTypeStrings.__index = SqlTypeStrings
SqlTypeStrings.className = "SqlTypeStrings"
SqlTypeStrings.javaClassName = "org.allbinary.logic.communication.sql.SqlTypeStrings"

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

function SqlTypeStrings._jinit(self)
    SqlTypeStrings._init_fields(self)
    return self
end

function SqlTypeStrings.new()
    return SqlTypeStrings._jinit(setmetatable({}, SqlTypeStrings))
end


function SqlTypeStrings.getInstance()
        return SqlTypeStrings.instance_f
end

SqlTypeStrings.instance_f = SqlTypeStrings.new()

return SqlTypeStrings

