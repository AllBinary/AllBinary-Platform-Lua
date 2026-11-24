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
-- package org.allbinary.data.tables.user.quoterequest

local QuoteRequestEntity = {}
package.loaded["org.allbinary.data.tables.user.quoterequest.QuoteRequestEntity"] = QuoteRequestEntity

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
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = java_lazy("org.allbinary.business.init.db.UserDbInitInfo")
local QuoteRequestData = java_lazy("org.allbinary.business.quoterequest.QuoteRequestData")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local QuoteRequest = java_lazy("org.allbinary.business.user.quoterequest.QuoteRequest")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local QuoteRequestEntityInterface = require("org.allbinary.data.tables.user.quoterequest.QuoteRequestEntityInterface")

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

-- class table QuoteRequestEntity is declared before the requires
QuoteRequestEntity.__index = QuoteRequestEntity
QuoteRequestEntity.className = "QuoteRequestEntity"
QuoteRequestEntity.javaClassName = "org.allbinary.data.tables.user.quoterequest.QuoteRequestEntity"
setmetatable(QuoteRequestEntity, {__index = AbSqlBean})
QuoteRequestEntity.java_implements = " QuoteRequestEntityInterface "
QuoteRequestEntity.java_interfaces = function() return {QuoteRequestEntityInterface} end

function QuoteRequestEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "quoterequest"
end


function QuoteRequestEntity._jinit(self)
    java_super_init(AbSqlBean, self, UserDbInitInfo.new())
    QuoteRequestEntity._init_fields(self)
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end

function QuoteRequestEntity.new(...)
    local self = setmetatable({}, QuoteRequestEntity)
    QuoteRequestEntity._jinit(self, ...)
    return self
end


function QuoteRequestEntity:insert(values)
        local try_ok, try_error, try_value = pcall(function()
            java_super(AbSqlBean, "insert", 1)(self, values)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, self.INSERT)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.INSERT, e)
            end
        end
end
java_overload(QuoteRequestEntity, "insert", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


-- throws Exception
function QuoteRequestEntity:get(userName, id)
        local row = StdUtil.getInstance():createHashMap()
        row:put(UserData.USERNAME, userName)
        row:put(QuoteRequestData.getInstance().ID, tostring(id))
        local quoteRequestHashMap = java_super(AbSqlBean, "getRow", 1)(self, row)
        if quoteRequestHashMap ~= nil then
            return QuoteRequest.new(quoteRequestHashMap)
        else
            return nil
        end
end
java_overload(QuoteRequestEntity, "get", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and type(java_a2) == "number" end)


function QuoteRequestEntity:getIds(userName)
        return java_super(AbSqlBean, "getColumnWhere", 3)(self, QuoteRequestData.getInstance().ID, UserData.USERNAME, userName)
end
java_overload(QuoteRequestEntity, "getIds", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function QuoteRequestEntity:deleteWhere(key, value)
        local try_ok, try_error, try_value = pcall(function()
            java_super(AbSqlBean, "deleteWhere", 2)(self, key, value)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "deleteWhere")
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "deleteWhere", e)
            end
        end
end
java_overload(QuoteRequestEntity, "deleteWhere", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") end)


function QuoteRequestEntity:createTableStatement()
        local quoteRequestData = QuoteRequestData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START)
        stringBuffer:append(quoteRequestData.ID):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(UserData.USERNAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(quoteRequestData.PROJECT_INFO)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(quoteRequestData.CUSTOMER_COMMENTS)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(quoteRequestData.BUDGET)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(quoteRequestData.TIMEFRAME)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(quoteRequestData.COMMENTS)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().TIMECREATED)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().LASTMODIFIED)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.sqlStrings.PRIMARY_KEY)
        stringBuffer:append(quoteRequestData.ID)
        stringBuffer:append(self.sqlStrings.END)
        return tostring(stringBuffer)
end
java_overload(QuoteRequestEntity, "createTableStatement", 0)


function QuoteRequestEntity:createTable()
        return java_super(AbSqlBean, "createTable", 1)(self, self:createTableStatement())
end
java_overload(QuoteRequestEntity, "createTable", 0)


function QuoteRequestEntity:dropTable()
        local result = tostring(java_super(AbSqlBean, "dropTable", 0)(self))
        return result
end
java_overload(QuoteRequestEntity, "dropTable", 0)


function QuoteRequestEntity:update(userName, updatedValues)
        java_super(AbSqlBean, "updateWhere", 3)(self, UserData.USERNAME, userName, updatedValues)
end
java_overload(QuoteRequestEntity, "update", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or java_is(java_a2, "HashMap")) end)

return QuoteRequestEntity

