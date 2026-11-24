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
-- package org.allbinary.data.tables.user.commerce.inventory.item

local InventoryEntity = {}
package.loaded["org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity"] = InventoryEntity

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
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local InventoryDbInitInfo = java_lazy("org.allbinary.business.init.db.InventoryDbInitInfo")
local BasicItem = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItem")
local BasicItemData = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local ItemInterface = java_lazy("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local MoneyException = java_lazy("org.allbinary.business.user.commerce.money.MoneyException")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local InventoryEntityInterface = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityInterface")

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

-- class table InventoryEntity is declared before the requires
InventoryEntity.__index = InventoryEntity
InventoryEntity.className = "InventoryEntity"
InventoryEntity.javaClassName = "org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity"
setmetatable(InventoryEntity, {__index = AbSqlBean})
InventoryEntity.java_implements = " InventoryEntityInterface "
InventoryEntity.java_interfaces = function() return {InventoryEntityInterface} end

function InventoryEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.tableName = "basicinventory"
end


function InventoryEntity._jinit(self)
    java_super_init(AbSqlBean, self, InventoryDbInitInfo.new())
    InventoryEntity._init_fields(self)
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end

function InventoryEntity.new(...)
    local self = setmetatable({}, InventoryEntity)
    InventoryEntity._jinit(self, ...)
    return self
end


function InventoryEntity:insert(values)
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
java_overload(InventoryEntity, "insert", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function InventoryEntity:delete(value)
        local try_ok, try_error, try_value = pcall(function()
            java_super(AbSqlBean, "deleteWhere", 2)(self, self.basicItemData.ID, value)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, self.commonStrings.delete)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.delete, e)
            end
        end
end
java_overload(InventoryEntity, "delete", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


-- throws Exception
function InventoryEntity:getItems(storeFrontInterface)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
            self.logUtil:putF("Getting Items For: " .. storeFrontInterface:getName(), self, "getItems")
        end
        local itemVector = BasicArrayListD.new()
        local keysAndValues = StdUtil.getInstance():createHashMap()
        local itemHashMapVector = java_super(AbSqlBean, "getRows", 1)(self, keysAndValues)
        local size = itemHashMapVector:size()
        for i = 0, size - 1 do
            local itemHashMap = itemHashMapVector:get(i)
            if itemHashMap ~= nil then
                local category = itemHashMap:get(self.basicItemData.CATEGORY)
                if not StringValidationUtil.getInstance():isEmpty(category) and (string.sub(category, 1, #storeFrontInterface:getCategoryPath()) == storeFrontInterface:getCategoryPath()) then
                    itemVector:add(BasicItem.new(itemHashMap))
                end
            end
        end
        return itemVector
end
java_overload(InventoryEntity, "getItems", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "StoreFrontInterface")) end)


-- throws MoneyException
function InventoryEntity:getItem(id)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        keysAndValues:put(self.basicItemData.ID, id)
        local itemHashMap = java_super(AbSqlBean, "getRow", 1)(self, keysAndValues)
        if itemHashMap ~= nil then
            return BasicItem.new(itemHashMap)
        else
            return nil
        end
end
java_overload(InventoryEntity, "getItem", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function InventoryEntity:getWeight(id)
        return java_super(AbSqlBean, "getField", 3)(self, self.basicItemData.ID, id, self.basicItemData.WEIGHT)
end
java_overload(InventoryEntity, "getWeight", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function InventoryEntity:createTableStatement()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE)
        stringBuffer:append(self.tableName)
        stringBuffer:append(self.sqlStrings.START)
        stringBuffer:append(self.basicItemData.ID)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.NUMBER)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.INBASKETS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.WEIGHT)
        stringBuffer:append(" VARCHAR(20) NOT NULL,")
        stringBuffer:append(EntryData.getInstance().ENABLE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.NEWORUSED)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.SUMMARY)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.DISTRIBUTOR)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.IDUSEDBYDISTRIBUTOR)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.PRODUCEDBY)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.PRODUCTIONDATE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.STARTPRODUCTIONDATE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.DESCRIPTION)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(self.basicItemData.KEYWORDS)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.CATEGORY)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.TYPE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.SMALLIMAGE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.MEDIUMIMAGE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.LARGEIMAGE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().LASTMODIFIED)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().TIMECREATED)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.PRICE)
        stringBuffer:append(" VARCHAR(20) NOT NULL,")
        stringBuffer:append(self.basicItemData.COMMENT)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(self.basicItemData.CUSTOMS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.DOWNLOADS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.GROUPS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.OPTIONS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.PERMISSIONS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.SPECIALS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.sqlStrings.PRIMARY_KEY)
        stringBuffer:append(self.basicItemData.ID)
        stringBuffer:append(self.sqlStrings.END)
        return tostring(stringBuffer)
end
java_overload(InventoryEntity, "createTableStatement", 0)


function InventoryEntity:createTable()
        return java_super(AbSqlBean, "createTable", 1)(self, self:createTableStatement())
end
java_overload(InventoryEntity, "createTable", 0)


function InventoryEntity:update(updatedValues)
        java_super(AbSqlBean, "updateWhere", 3)(self, self.basicItemData.ID, updatedValues:get(self.basicItemData.ID), updatedValues)
end
java_overload(InventoryEntity, "update", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HashMap")) end)


function InventoryEntity:dropTable()
        return java_super(AbSqlBean, "dropTable", 0)(self)
end
java_overload(InventoryEntity, "dropTable", 0)


function InventoryEntity:deleteWhere(key, value)
        java_super(AbSqlBean, "deleteWhere", 2)(self, key, value)
end
java_overload(InventoryEntity, "deleteWhere", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") end)

return InventoryEntity

