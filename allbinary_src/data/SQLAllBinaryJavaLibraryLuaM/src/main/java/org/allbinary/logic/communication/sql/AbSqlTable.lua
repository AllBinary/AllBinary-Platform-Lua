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

local AbSqlTable = {}
package.loaded["org.allbinary.logic.communication.sql.AbSqlTable"] = AbSqlTable

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

local DbConnectionInfo = java_lazy("org.allbinary.business.init.db.DbConnectionInfo")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbSqlBasic = require("org.allbinary.logic.communication.sql.AbSqlBasic")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table AbSqlTable is declared before the requires
AbSqlTable.__index = AbSqlTable
AbSqlTable.className = "AbSqlTable"
AbSqlTable.javaClassName = "org.allbinary.logic.communication.sql.AbSqlTable"
setmetatable(AbSqlTable, {__index = AbSqlBasic})

function AbSqlTable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.tableName == nil then self.tableName = nil end
    self.METHOD_CREATED_TABLE = "createTable()"
    self.METHOD_DROP_TABLE = "dropTable()"
    self.TABLE_CREATION_SUCCESS = "Table Creation Successful: "
    self.DROPPED_SUCCESS = " Dropped Successfully"
end


function AbSqlTable._jinit(self, databaseConnectionInfoInterface)
    java_super_init(AbSqlBasic, self, databaseConnectionInfoInterface)
    AbSqlTable._init_fields(self)
        -- super(...) made self above
    return self
end

function AbSqlTable.new(...)
    local self = setmetatable({}, AbSqlTable)
    AbSqlTable._jinit(self, ...)
    return self
end


function AbSqlTable:setTableName(tableName)
        self.tableName = tableName
end
java_overload(AbSqlTable, "setTableName", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function AbSqlTable:getTableName()
        return self.tableName
end
java_overload(AbSqlTable, "getTableName", 0)


function AbSqlTable:createTable(data)
        local try_ok, try_error, try_value = pcall(function()
            self:executeSQLStatement(data)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(self.TABLE_CREATION_SUCCESS) .. require("allbinary_java").to_string(self.tableName)) .. require("allbinary_java").to_string(" with statement: ")) .. require("allbinary_java").to_string(data), self, self.METHOD_CREATED_TABLE)
            end
            do return "__jreturn", require("allbinary_java").to_string(self.tableName) .. require("allbinary_java").to_string(self.sqlStrings.CREATE_RETURN) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Table Creation Failed: ") .. require("allbinary_java").to_string(self.tableName)) .. require("allbinary_java").to_string(" with statement: ")) .. require("allbinary_java").to_string(data), self, self.METHOD_CREATED_TABLE, e)
            end
            return require("allbinary_java").to_string(require("allbinary_java").to_string("Failed to Create ") .. require("allbinary_java").to_string(self.tableName)) .. require("allbinary_java").to_string(" table.")
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AbSqlTable, "createTable", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function AbSqlTable:dropTable()
        local sqlStatement = require("allbinary_java").to_string(self.sqlStrings.DROP_TABLE) .. require("allbinary_java").to_string(self.tableName)
        local try_ok, try_error, try_value = pcall(function()
            self:executeSQLStatement(sqlStatement)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(require("allbinary_java").to_string(self.SUCCESS_SQL_STATEMENT) .. require("allbinary_java").to_string(sqlStatement), self, self.METHOD_DROP_TABLE)
            end
            do return "__jreturn", require("allbinary_java").to_string(self.tableName) .. require("allbinary_java").to_string(self.DROPPED_SUCCESS) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(require("allbinary_java").to_string(self.FAILED_SQL_STATEMENT) .. require("allbinary_java").to_string(sqlStatement), self, self.METHOD_DROP_TABLE, e)
            end
            return require("allbinary_java").to_string(require("allbinary_java").to_string("Failed to Drop ") .. require("allbinary_java").to_string(self.tableName)) .. require("allbinary_java").to_string(" table.")
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AbSqlTable, "dropTable", 0)

return AbSqlTable

