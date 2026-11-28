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
-- package views.admin.inventory

local AddFileValidationView = {}
package.loaded["views.admin.inventory.AddFileValidationView"] = AddFileValidationView

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

local StoreFrontFactory = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasicItemData = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local BasicItemValidation = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemValidation")
local MoneyException = java_lazy("org.allbinary.business.user.commerce.money.MoneyException")
local InventoryEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local GLOBALS2 = java_lazy("org.allbinary.globals.GLOBALS2")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local HttpFileUploadUtil = java_lazy("org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil")
local UploadMediaSingleton = java_lazy("org.allbinary.logic.communication.http.file.upload.media.UploadMediaSingleton")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = java_lazy("org.allbinary.logic.control.validate.ValidationComponentInterface")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local FileData = java_lazy("org.allbinary.logic.io.file.FileData")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local FileItem = java_lazy("org.apache.commons.fileupload.FileItem")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local InventoryItemView = require("views.admin.inventory.InventoryItemView")

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

-- class table AddFileValidationView is declared before the requires
AddFileValidationView.__index = AddFileValidationView
AddFileValidationView.className = "AddFileValidationView"
AddFileValidationView.javaClassName = "views.admin.inventory.AddFileValidationView"
setmetatable(AddFileValidationView, {__index = InventoryItemView})
AddFileValidationView.java_implements = " ValidationComponentInterface "
AddFileValidationView.java_interfaces = function() return {ValidationComponentInterface} end

function AddFileValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
end


function AddFileValidationView._jinit(self, transformInfoInterface)
    java_super_init(InventoryItemView, self, transformInfoInterface)
    AddFileValidationView._init_fields(self)
        -- super(...) made self above
    return self
end

function AddFileValidationView.new(...)
    local self = setmetatable({}, AddFileValidationView)
    AddFileValidationView._jinit(self, ...)
    return self
end


function AddFileValidationView:isValid_j0()
        local try_ok, try_error, try_value = pcall(function()
            local command = self:getRequestHashMap():get(GLOBALS2.ADMINCOMMAND)
            if StringValidationUtil.getInstance():isEmpty(command) or (not rawequal(((command < AddFileValidationView.ADDPRODUCT and -1) or (command > AddFileValidationView.ADDPRODUCT and 1) or 0), 0) and not rawequal(((command < AddFileValidationView.NEXTSTEP and -1) or (command > AddFileValidationView.NEXTSTEP and 1) or 0), 0)) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("Invalid AdminCommand: ")
                    stringBuffer:append(command)
                    stringBuffer:append(" must be: ")
                    stringBuffer:append(AddFileValidationView.ADDPRODUCT)
                    stringBuffer:append(" or ")
                    stringBuffer:append(AddFileValidationView.NEXTSTEP)
                    self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
                end
                do return "__jreturn", false end
            end
            local basicItemValidation = BasicItemValidation.new(self.itemInterface)
            if rawequal(basicItemValidation:isValid(), false) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    self.logUtil:putF(basicItemValidation:validationInfo(), self, self.commonStrings.IS_VALID)
                end
                do return "__jreturn", false end
            end
            local storeFrontInterface = StoreFrontFactory.getInstance(self:getWeblisketSession():getStoreName())
            self.itemInterface:setCategory(storeFrontInterface:getCategoryPath() + self.itemInterface:getCategory())
            local fullCategory = tostring(StringMaker.new():append(URLGLOBALS.getWebappPath()):append(storeFrontInterface:getCurrentHostNamePath()):append(self.itemInterface:getCategory()))
            local categoryFile = AbFile.createAbFile(fullCategory)
            if not (categoryFile:isDirectory()) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    self.logUtil:putF(require("allbinary_java").to_string("Category Does Not Exist: ") .. require("allbinary_java").to_string(fullCategory), self, self.commonStrings.IS_VALID)
                end
                do return "__jreturn", false end
            end
            if not rawequal(InventoryEntityFactory.getInstance():getInventoryEntityInstance():getItem(self.itemInterface:getId()), nil) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    self.logUtil:putF("Item Already Exists", self, self.commonStrings.IS_VALID)
                end
                do return "__jreturn", false end
            end
            local imageFileItemObject = self:getRequestHashMap():get(self.basicItemData.IMAGE)
            if HttpFileUploadUtil.getInstance():isValid(imageFileItemObject) then
                local fileItem = imageFileItemObject
                local fileName = fileItem:getName()
                local size = fileItem:getSize()
                HttpFileUploadUtil.log(fileItem)
                if rawequal(self:isValid(fileName, size), false) then
                    do return "__jreturn", false end
                end
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put("Exception in validation", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function AddFileValidationView:toValidationInfoDoc()
        return nil
end
java_overload(AddFileValidationView, "toValidationInfoDoc", 0)


function AddFileValidationView:toValidationInfoNode(document)
        return nil
end
java_overload(AddFileValidationView, "toValidationInfoNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


function AddFileValidationView:validationInfo_j0()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            local command = self:getRequestHashMap():get(GLOBALS2.ADMINCOMMAND)
            if StringValidationUtil.getInstance():isEmpty(command) or (not rawequal(((command < AddFileValidationView.ADDPRODUCT and -1) or (command > AddFileValidationView.ADDPRODUCT and 1) or 0), 0) and not rawequal(((command < AddFileValidationView.NEXTSTEP and -1) or (command > AddFileValidationView.NEXTSTEP and 1) or 0), 0)) then
                do return "__jreturn", StringUtil.getInstance().EMPTY_STRING end
            end
            local basicItemValidation = BasicItemValidation.new(self.itemInterface)
            if rawequal(basicItemValidation:isValid(), false) then
                stringBuffer:append(basicItemValidation:validationInfo())
                stringBuffer:append("<br/>")
            end
            local storeFrontInterface = StoreFrontFactory.getInstance(self:getWeblisketSession():getStoreName())
            local fullCategory = tostring(StringMaker.new():append(URLGLOBALS.getWebappPath()):append(storeFrontInterface:getCurrentHostNamePath()):append(self.itemInterface:getCategory()))
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("Category: ") .. require("allbinary_java").to_string(fullCategory), self, "validationInfo()")
            end
            local categoryFile = AbFile.createAbFile(fullCategory)
            if not (categoryFile:isDirectory()) then
                stringBuffer:append("Category ")
                stringBuffer:append(self.itemInterface:getCategory())
                stringBuffer:append(" does not exist.<br />")
            end
            local try_ok, try_error, try_value = pcall(function()
                if not rawequal(InventoryEntityFactory.getInstance():getInventoryEntityInstance():getItem(self.itemInterface:getId()), nil) then
                    stringBuffer:append("Id is already in use. Refresh the page for a valid id.<br/>")
                end
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    self.logUtil:putF("Existing Item With MoneyException", self, "validationInfo()")
                end
            end
            local anyType = self:getRequestHashMap():get(self.basicItemData.IMAGE)
            if HttpFileUploadUtil.getInstance():isValid(anyType) then
                local fileItem = anyType
                local fileName = fileItem:getName()
                local fileItemFieldName = fileItem:getFieldName()
                local size = fileItem:getSize()
                self:validationInfo(stringBuffer, fileName, fileItemFieldName, size)
            end
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Getting Validation Info"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function AddFileValidationView:isValid_j2(fileName, size)
        local fileData = FileData.getInstance()
        if size > fileData.MINIMAGEFILESIZE then
            if size < fileData.MAXIMAGEFILESIZE then
                if not (StringValidationUtil.getInstance():isValidRequired(fileName, fileData.MINLEN, fileData.MAXLEN)) then
                    return false
                else
                    local pathData = AbPathData.getInstance()
                    local extension = pathData:getExtension(fileName)
                    local uploadMedia = UploadMediaSingleton.getInstance()
                    if not (uploadMedia:isWriterSupported(extension)) and not (uploadMedia:isReaderSupported(extension)) then
                        return false
                    end
                end
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("File Size To Large: ")
                    stringBuffer:appendlong(size)
                    stringBuffer:append(">")
                    stringBuffer:appendint(java_int(fileData.MAXIMAGEFILESIZE))
                    self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
                end
                return false
            end
            self:processImageFiles()
        else
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("File Size To Small: ")
                stringBuffer:appendlong(size)
                stringBuffer:append(">")
                stringBuffer:appendint(java_int(fileData.MINIMAGEFILESIZE))
                self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
            end
            return false
        end
        return true
end
function AddFileValidationView:isValid(...)
    local count = select("#", ...)
    if count == 0 then return self:isValid_j0(...) end
    if count == 2 then return self:isValid_j2(...) end
    local parent = getmetatable(AddFileValidationView).__index
    if parent.isValid then return parent.isValid(self, ...) end
    error("No method isValid takes " .. count .. " arguments")
end
AddFileValidationView.isValid__jdispatcher = AddFileValidationView.isValid


function AddFileValidationView:validationInfo_j4(stringBuffer, fileName, fileItemFieldName, size)
        local fileData = FileData.getInstance()
        if size > fileData.MINIMAGEFILESIZE then
            if rawequal(((fileItemFieldName < self.basicItemData.IMAGE and -1) or (fileItemFieldName > self.basicItemData.IMAGE and 1) or 0), 0) then
                if size < fileData.MAXIMAGEFILESIZE then
                    if not (StringValidationUtil.getInstance():isValidRequired(fileName, fileData.MINLEN, fileData.MAXLEN)) then
                        stringBuffer:append("FileName must be >")
                        stringBuffer:appendint(java_int(fileData.MINLEN))
                        stringBuffer:append(" and <")
                        stringBuffer:appendint(java_int(fileData.MAXLEN))
                        stringBuffer:append("<br/>")
                    else
                        local pathData = AbPathData.getInstance()
                        local extension = pathData:getExtension(fileName)
                        local uploadMedia = UploadMediaSingleton.getInstance()
                        if not (uploadMedia:isWriterSupported(extension)) and not (uploadMedia:isReaderSupported(extension)) then
                            stringBuffer:append("Image type: ")
                            stringBuffer:append(extension)
                            stringBuffer:append(" not supported.<br />")
                        end
                    end
                else
                    stringBuffer:append("Image File Is To Large. ")
                    stringBuffer:appendint(java_int(fileData.MINIMAGEFILESIZE))
                    stringBuffer:append(" < > ")
                    stringBuffer:appendint(java_int(fileData.MAXIMAGEFILESIZE))
                    stringBuffer:append("<br/>")
                end
            end
        else
            stringBuffer:append("Image File Is To Small. ")
            stringBuffer:appendint(java_int(fileData.MINIMAGEFILESIZE))
            stringBuffer:append(" < > ")
            stringBuffer:appendint(java_int(fileData.MAXIMAGEFILESIZE))
            stringBuffer:append("<br/>")
        end
end
function AddFileValidationView:validationInfo(...)
    local count = select("#", ...)
    if count == 0 then return self:validationInfo_j0(...) end
    if count == 4 then return self:validationInfo_j4(...) end
    local parent = getmetatable(AddFileValidationView).__index
    if parent.validationInfo then return parent.validationInfo(self, ...) end
    error("No method validationInfo takes " .. count .. " arguments")
end
AddFileValidationView.validationInfo__jdispatcher = AddFileValidationView.validationInfo


-- throws Exception
function AddFileValidationView:getTransformInfoInterface()
        return java_super(InventoryItemView, "getTransformInfoInterface", 0)(self)
end
java_overload(AddFileValidationView, "getTransformInfoInterface", 0)

AddFileValidationView.ADDPRODUCT = "Add Product"
AddFileValidationView.NEXTSTEP = require("allbinary_java").to_string(CommonLabels.getInstance().NEXT) .. require("allbinary_java").to_string(" Step")

return AddFileValidationView

