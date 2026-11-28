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
-- package admin.taghelpers

local BasicOptionItemsRequestHelper = {}
package.loaded["admin.taghelpers.BasicOptionItemsRequestHelper"] = BasicOptionItemsRequestHelper

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

local Calendar = java_lazy("java.util.Calendar")
local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local BasicItemData = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local BasicOptionItemData = java_lazy("org.allbinary.business.user.commerce.inventory.item.option.BasicOptionItemData")
local BasicOptionItemsEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.options.BasicOptionItemsEntityFactory")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local ModifyTable = require("admin.taghelpers.ModifyTable")

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

-- class table BasicOptionItemsRequestHelper is declared before the requires
BasicOptionItemsRequestHelper.__index = BasicOptionItemsRequestHelper
BasicOptionItemsRequestHelper.className = "BasicOptionItemsRequestHelper"
BasicOptionItemsRequestHelper.javaClassName = "admin.taghelpers.BasicOptionItemsRequestHelper"
setmetatable(BasicOptionItemsRequestHelper, {__index = ModifyTable})

function BasicOptionItemsRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    if self.request == nil then self.request = nil end
    if self.id == nil then self.id = nil end
    if self.optionOneTitle == nil then self.optionOneTitle = nil end
    if self.defaultOptionItem == nil then self.defaultOptionItem = nil end
    if self.defaultOptionValue == nil then self.defaultOptionValue = nil end
    if self.optionItem == nil then self.optionItem = nil end
    if self.optionValue == nil then self.optionValue = nil end
    if self.timeEntered == nil then self.timeEntered = nil end
    if self.lastModified == nil then self.lastModified = nil end
end


function BasicOptionItemsRequestHelper._jinit(self, hashMap, pageContext)
    java_super_init(ModifyTable, self)
    BasicOptionItemsRequestHelper._init_fields(self)
        self.request = pageContext:getRequest()
        self:getFormData()
    return self
end

function BasicOptionItemsRequestHelper.new(...)
    local self = setmetatable({}, BasicOptionItemsRequestHelper)
    BasicOptionItemsRequestHelper._jinit(self, ...)
    return self
end


function BasicOptionItemsRequestHelper:getFormData()
        self.optionItem = BasicArrayListD.new()
        self.optionValue = BasicArrayListD.new()
        self.id = self.request:getParameter(self.basicItemData.ID)
        self.optionOneTitle = self.request:getParameter(BasicOptionItemData.OPTION_ONE_TITLE)
        self.defaultOptionItem = self.request:getParameter(BasicOptionItemData.DEFAULT_OPTION_ITEM)
        self.defaultOptionValue = self.request:getParameter(BasicOptionItemData.DEFAULT_OPTION_VALUE)
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_ONE_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_ONE_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_TWO_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_TWO_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_THREE_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_THREE_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_FOUR_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_FOUR_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_FIVE_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_FIVE_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_SIX_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_SIX_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_SEVEN_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_SEVEN_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_EIGHT_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_EIGHT_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_NINE_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_NINE_VALUE))
        self.timeEntered = self.request:getParameter(EntryData.getInstance().TIMECREATED)
        self.lastModified = self.request:getParameter(EntryData.getInstance().LASTMODIFIED)
end
java_overload(BasicOptionItemsRequestHelper, "getFormData", 0)


function BasicOptionItemsRequestHelper:getHashMap()
        local values = StdUtil.getInstance():createHashMap()
        values:put(self.basicItemData.ID, self.id)
        values:put(BasicOptionItemData.OPTION_ONE_ONE_ITEM, self.optionItem:get(0))
        values:put(BasicOptionItemData.OPTION_ONE_ONE_VALUE, self.optionValue:get(0))
        values:put(BasicOptionItemData.OPTION_ONE_TWO_ITEM, self.optionItem:get(1))
        values:put(BasicOptionItemData.OPTION_ONE_TWO_VALUE, self.optionValue:get(1))
        values:put(BasicOptionItemData.OPTION_ONE_THREE_ITEM, self.optionItem:get(2))
        values:put(BasicOptionItemData.OPTION_ONE_THREE_VALUE, self.optionValue:get(2))
        values:put(BasicOptionItemData.OPTION_ONE_FOUR_ITEM, self.optionItem:get(3))
        values:put(BasicOptionItemData.OPTION_ONE_FOUR_VALUE, self.optionValue:get(3))
        values:put(BasicOptionItemData.OPTION_ONE_FIVE_ITEM, self.optionItem:get(4))
        values:put(BasicOptionItemData.OPTION_ONE_FIVE_VALUE, self.optionValue:get(4))
        values:put(BasicOptionItemData.OPTION_ONE_SIX_ITEM, self.optionItem:get(5))
        values:put(BasicOptionItemData.OPTION_ONE_SIX_VALUE, self.optionValue:get(5))
        values:put(BasicOptionItemData.OPTION_ONE_SEVEN_ITEM, self.optionItem:get(6))
        values:put(BasicOptionItemData.OPTION_ONE_SEVEN_VALUE, self.optionValue:get(6))
        values:put(BasicOptionItemData.OPTION_ONE_EIGHT_ITEM, self.optionItem:get(7))
        values:put(BasicOptionItemData.OPTION_ONE_EIGHT_VALUE, self.optionValue:get(7))
        values:put(BasicOptionItemData.OPTION_ONE_NINE_ITEM, self.optionItem:get(8))
        values:put(BasicOptionItemData.OPTION_ONE_NINE_VALUE, self.optionValue:get(8))
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        values:put(EntryData.getInstance().LASTMODIFIED, time)
        return values
end
java_overload(BasicOptionItemsRequestHelper, "getHashMap", 0)


function BasicOptionItemsRequestHelper:insert()
        local try_ok, try_error, try_value = pcall(function()
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            local values = BasicArrayListD.new()
            values:add(self.id)
            local size = self.optionValue:size()
            for index = 0, size - 1 do
                values:add(self.optionValue:get(index))
                values:add(self.optionItem:get(index))
            end
            values:add(time)
            values:add(time)
            BasicOptionItemsEntityFactory.getInstance():getBasicOptionItemsEntityInstance():insert(values)
            local success = require("allbinary_java").to_string(require("allbinary_java").to_string("Successfully inserted ") .. require("allbinary_java").to_string(self.id)) .. require("allbinary_java").to_string(" into items table")
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "insert()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = require("allbinary_java").to_string(require("allbinary_java").to_string("Failed to insert ") .. require("allbinary_java").to_string(self.id)) .. require("allbinary_java").to_string(" into items table")
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "inserts()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(BasicOptionItemsRequestHelper, "insert", 0)


function BasicOptionItemsRequestHelper:delete()
        local try_ok, try_error, try_value = pcall(function()
            BasicOptionItemsEntityFactory.getInstance():getBasicOptionItemsEntityInstance():delete(self.id)
            local success = "Successfully deleted"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "delete()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to delete"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(BasicOptionItemsRequestHelper, "delete", 0)


function BasicOptionItemsRequestHelper:update()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Update Pricing Successful"
            local values = self:getHashMap()
            BasicOptionItemsEntityFactory.getInstance():getBasicOptionItemsEntityInstance():update(values)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(tostring(StringMaker.new():append(self.id):append(CommonSeps.getInstance().SPACE):append(success)), self, "update()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = require("allbinary_java").to_string("Failed to update: ") .. require("allbinary_java").to_string(self.id)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(BasicOptionItemsRequestHelper, "update", 0)

return BasicOptionItemsRequestHelper

