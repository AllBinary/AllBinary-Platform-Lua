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
-- package views.admin.inventory.download

local DownloadableInventoryItemView = {}
package.loaded["views.admin.inventory.download.DownloadableInventoryItemView"] = DownloadableInventoryItemView

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

local ByteArrayInputStream = java_lazy("java.io.ByteArrayInputStream")
local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local StoreFrontFactory = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasicItemData = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local BasicItemView = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemView")
local ItemInterface = java_lazy("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local DownloadableItem = java_lazy("org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem")
local DownloadableItemView = java_lazy("org.allbinary.business.user.commerce.inventory.item.download.DownloadableItemView")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local MultipartRequestParams = java_lazy("org.allbinary.logic.communication.http.request.MultipartRequestParams")
local RequestMapInterface = java_lazy("org.allbinary.logic.communication.http.request.RequestMapInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local FilePathData = java_lazy("org.allbinary.logic.io.file.FilePathData")
local FileUtil = java_lazy("org.allbinary.logic.io.file.FileUtil")
local ZipFileUtil = java_lazy("org.allbinary.logic.io.file.zip.ZipFileUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local FileItem = java_lazy("org.apache.commons.fileupload.FileItem")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table DownloadableInventoryItemView is declared before the requires
DownloadableInventoryItemView.__index = DownloadableInventoryItemView
DownloadableInventoryItemView.className = "DownloadableInventoryItemView"
DownloadableInventoryItemView.javaClassName = "views.admin.inventory.download.DownloadableInventoryItemView"
setmetatable(DownloadableInventoryItemView, {__index = HttpStoreComponentView})
DownloadableInventoryItemView.java_implements = " RequestMapInterface "
DownloadableInventoryItemView.java_interfaces = function() return {RequestMapInterface} end

function DownloadableInventoryItemView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    if self.request == nil then self.request = nil end
    if self.id == nil then self.id = nil end
    if self.itemInterface == nil then self.itemInterface = nil end
    if self.downloadableItem == nil then self.downloadableItem = nil end
    if self.requestHashMap == nil then self.requestHashMap = nil end
end

function DownloadableInventoryItemView._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return DownloadableInventoryItemView._new1(self, ...)
    elseif count == 2 then return DownloadableInventoryItemView._new2(self, ...)
    end
    error("No constructor of DownloadableInventoryItemView takes " .. count .. " arguments")
end

function DownloadableInventoryItemView.new(...)
    local self = setmetatable({}, DownloadableInventoryItemView)
    DownloadableInventoryItemView._jinit(self, ...)
    return self
end


function DownloadableInventoryItemView._new1(self, transformInfoInterface)
    java_super_init(HttpStoreComponentView, self, transformInfoInterface)
    DownloadableInventoryItemView._init_fields(self)
        -- super(...) made self above
        self.request = self:getPageContext():getRequest()
        self:getFormData()
    return self
end


function DownloadableInventoryItemView._new2(self, transformInfoInterface, empty)
    java_super_init(HttpStoreComponentView, self, transformInfoInterface)
    DownloadableInventoryItemView._init_fields(self)
        -- super(...) made self above
        self.request = self:getPageContext():getRequest()
    return self
end


function DownloadableInventoryItemView:getTypeId()
        return DownloadableInventoryItemView.TYPE_ID
end
java_overload(DownloadableInventoryItemView, "getTypeId", 0)


-- throws Exception
function DownloadableInventoryItemView:getFormData()
        self:setRequestHashMap(MultipartRequestParams.new(self.request):toHashMap())
        self.id = self:getRequestHashMap():get(self.basicItemData.ID)
end
java_overload(DownloadableInventoryItemView, "getFormData", 0)


function DownloadableInventoryItemView:addDomNodeInterfaces()
        local vector = BasicArrayListD.new()
        if not rawequal(self.downloadableItem, nil) then
            vector:add(DownloadableItemView.new(self.downloadableItem))
        end
        self:addDomNodeInterface(BasicItemView.new(self.itemInterface, vector))
end
java_overload(DownloadableInventoryItemView, "addDomNodeInterfaces", 0)


-- throws Exception
function DownloadableInventoryItemView:view()
        local try_ok, try_error, try_value = pcall(function()
            self:addDomNodeInterfaces()
            do return "__jreturn", java_super(HttpStoreComponentView, "view", 0)(self) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(DownloadableInventoryItemView, "view", 0)


-- throws Exception
function DownloadableInventoryItemView:processFile(fileItem)
        local fileName = fileItem:getName()
        local fullPath = self:getItemFilePath()
        local itemResourceFile = AbFile.createAbFile(fullPath)
        itemResourceFile:mkdir()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(fullPath)
        stringBuffer:append(fileName)
        self.logUtil:putF(require("allbinary_java").to_string("FileName: ") .. require("allbinary_java").to_string(fileName), self, "processFile()")
        local file = AbFile.createAbFile(tostring(stringBuffer))
        self.logUtil:putF(file:getPath(), self, "processFiles()")
        file:createNewFile()
        local byteArray = fileItem:get()
        FileUtil.getInstance():write(ByteArrayInputStream.new(byteArray), file)
end
java_overload(DownloadableInventoryItemView, "processFile", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "FileItem")) end)


-- throws Exception
function DownloadableInventoryItemView:unzip(fileItem)
        local fileName = fileItem:getName()
        local fullPath = self:getItemFilePath()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(fullPath)
        stringBuffer:append(fileName)
        self.logUtil:putF(require("allbinary_java").to_string("FileName: ") .. require("allbinary_java").to_string(fileName), self, "unzip()")
        local file = AbFile.createAbFile(tostring(stringBuffer))
        self.logUtil:putF(file:getPath(), self, "unzip()")
        ZipFileUtil.getInstance():unzip(fullPath, file, fileName)
end
java_overload(DownloadableInventoryItemView, "unzip", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "FileItem")) end)


function DownloadableInventoryItemView:getItemFilePath()
        local storeFrontInterface = StoreFrontFactory.getInstance(self:getWeblisketSession():getStoreName())
        local filePathData = FilePathData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(URLGLOBALS.getWebappPath())
        stringBuffer:append(storeFrontInterface:getCurrentHostNamePath())
        stringBuffer:append(self.itemInterface:getCategory())
        stringBuffer:appendchar(filePathData.SEPARATORCHAR)
        stringBuffer:append(self.itemInterface:getId())
        stringBuffer:appendchar(filePathData.SEPARATORCHAR)
        stringBuffer:append(self.downloadableItem:getId())
        stringBuffer:appendchar(filePathData.SEPARATORCHAR)
        return tostring(stringBuffer)
end
java_overload(DownloadableInventoryItemView, "getItemFilePath", 0)


function DownloadableInventoryItemView:setRequestHashMap(requestHashMap)
        self.requestHashMap = requestHashMap
end
java_overload(DownloadableInventoryItemView, "setRequestHashMap", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HashMap")) end)


function DownloadableInventoryItemView:getRequestHashMap()
        return self.requestHashMap
end
java_overload(DownloadableInventoryItemView, "getRequestHashMap", 0)


function DownloadableInventoryItemView:getDownloadableItem()
        return self.downloadableItem
end
java_overload(DownloadableInventoryItemView, "getDownloadableItem", 0)

DownloadableInventoryItemView.TYPE_ID = 11

return DownloadableInventoryItemView

