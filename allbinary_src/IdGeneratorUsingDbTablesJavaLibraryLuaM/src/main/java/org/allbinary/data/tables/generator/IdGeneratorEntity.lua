-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
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
-- package org.allbinary.data.tables.generator

local IdGeneratorEntity = {}
package.loaded["org.allbinary.data.tables.generator.IdGeneratorEntity"] = IdGeneratorEntity

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

local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local UserDbInitInfo = java_lazy("org.allbinary.business.init.db.UserDbInitInfo")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local IdGeneratorEntityInterface = require("org.allbinary.data.tables.generator.IdGeneratorEntityInterface")

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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table IdGeneratorEntity is declared before the requires
IdGeneratorEntity.__index = IdGeneratorEntity
IdGeneratorEntity.className = "IdGeneratorEntity"
IdGeneratorEntity.javaClassName = "org.allbinary.data.tables.generator.IdGeneratorEntity"
setmetatable(IdGeneratorEntity, {__index = AbSqlBean})
IdGeneratorEntity.java_implements = " IdGeneratorEntityInterface "
IdGeneratorEntity.java_interfaces = function() return {IdGeneratorEntityInterface} end

function IdGeneratorEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "idgenerator"
    if self.tableData == nil then self.tableData = nil end
    self.NAME = "NAME"
    self.VALUE = "VALUE"
end


function IdGeneratorEntity._jinit(self)
    java_super_init(AbSqlBean, self, UserDbInitInfo.new())
    IdGeneratorEntity._init_fields(self)
        -- super(...) made self above
        self.tableData = tostring(StringMaker.new():append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START):append(self.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(self.VALUE):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(self.NAME):append(self.sqlStrings.END))
        java_super(AbSqlBean, "setTableName", 1)(self, self.tableName)
    return self
end

function IdGeneratorEntity.new(...)
    local self = setmetatable({}, IdGeneratorEntity)
    IdGeneratorEntity._jinit(self, ...)
    return self
end


-- throws Exception
function IdGeneratorEntity:get(name)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        keysAndValues:put(self.NAME, name)
        local hashMap = java_super(AbSqlBean, "getRow", 1)(self, keysAndValues)
        if not rawequal((hashMap:get(self.NAME)):compareTo(name), 0) then
            error(require("java.lang.Exception").new("results do not match"), 0)
        end
        local value = hashMap:get(self.VALUE)
        return math.tointeger(tonumber(value))
end
java_overload(IdGeneratorEntity, "get", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function IdGeneratorEntity:insert(values)
        local try_ok, try_error, try_value = pcall(function()
            java_super(AbSqlBean, "insert", 1)(self, values)
            self.logUtil:putF(self.commonStrings.SUCCESS, self, self.INSERT)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.FAILURE, self, self.INSERT, e)
        end
end
java_overload(IdGeneratorEntity, "insert", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function IdGeneratorEntity:delete(value)
        local try_ok, try_error, try_value = pcall(function()
            java_super(AbSqlBean, "deleteWhere", 2)(self, self.NAME, value)
            self.logUtil:putF(self.commonStrings.SUCCESS, self, self.commonStrings.delete)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.delete, e)
        end
end
java_overload(IdGeneratorEntity, "delete", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function IdGeneratorEntity:update_j2(name, value)
        local map = StdUtil.getInstance():createHashMap()
        map:put(self.NAME, name)
        map:put(self.VALUE, value)
        self:update(map)
end


function IdGeneratorEntity:update_j1(hashMap)
        java_super(AbSqlBean, "updateWhere", 3)(self, self.NAME, hashMap:get(self.NAME), hashMap)
end
function IdGeneratorEntity:update(...)
    local count = select("#", ...)
    if count == 2 then return self:update_j2(...) end
    if count == 1 then return self:update_j1(...) end
    local parent = getmetatable(IdGeneratorEntity).__index
    if parent.update then return parent.update(self, ...) end
    error("No method update takes " .. count .. " arguments")
end
IdGeneratorEntity.update__jdispatcher = IdGeneratorEntity.update


function IdGeneratorEntity:createTable()
        local returnStr = java_super(AbSqlBean, "createTable", 1)(self, self.tableData)
        return returnStr
end
java_overload(IdGeneratorEntity, "createTable", 0)


function IdGeneratorEntity:dropTable()
        return java_super(AbSqlBean, "dropTable", 0)(self)
end
java_overload(IdGeneratorEntity, "dropTable", 0)


function IdGeneratorEntity:deleteWhere(key, value)
        java_super(AbSqlBean, "deleteWhere", 2)(self, key, value)
end
java_overload(IdGeneratorEntity, "deleteWhere", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") end)

return IdGeneratorEntity

