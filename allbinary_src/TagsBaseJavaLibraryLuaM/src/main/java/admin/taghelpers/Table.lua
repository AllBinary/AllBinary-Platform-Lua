-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package admin.taghelpers

local CommonStrings = require("org.allbinary.string.CommonStrings")
local TableInterface = require("admin.taghelpers.TableInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Table = {}
Table.__index = Table
Table.className = "Table"

function Table:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
end

function Table.new()
    local self = setmetatable({}, Table)
    self:_init_fields()
    return self
end


-- throws Exception
function Table:drop()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function Table:create()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function Table:restore()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function Table:backup()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function Table:insert()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function Table:delete()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function Table:update()
        error(java_exception("RuntimeException"), 0)
end

return Table

