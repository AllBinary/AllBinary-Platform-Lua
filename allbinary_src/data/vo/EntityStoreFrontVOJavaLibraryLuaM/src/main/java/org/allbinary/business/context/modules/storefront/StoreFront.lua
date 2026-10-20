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
-- package org.allbinary.business.context.modules.storefront

-- local Calendar = require("java.util.Calendar")
-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local ContextConfiguration = require("org.allbinary.business.context.configuration.ContextConfiguration")
local ContextConfigurationDomDocumentMapping = require("org.allbinary.business.context.configuration.ContextConfigurationDomDocumentMapping")
local ContextConfigurationInterface = require("org.allbinary.business.context.configuration.ContextConfigurationInterface")
local ContextConfigurationInterfaceFactory = require("org.allbinary.business.context.configuration.ContextConfigurationInterfaceFactory")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserData = require("org.allbinary.business.user.UserData")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local StdUtil = require("org.allbinary.logic.StdUtil")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FileUtil = require("org.allbinary.logic.io.file.FileUtil")
local Directory = require("org.allbinary.logic.io.file.directory.Directory")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local AbPathUtil = require("org.allbinary.logic.io.path.AbPathUtil")
local SpecialCharacterUtil = require("org.allbinary.logic.string.SpecialCharacterUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local Replace = require("org.allbinary.logic.string.regex.replace.Replace")
local Tokenizer = require("org.allbinary.logic.string.tokens.Tokenizer")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StringEscapeUtils = require("org.apache.commons.lang3.StringEscapeUtils")
local Document = require("org.w3c.dom.Document")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")

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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local StoreFront = {}
StoreFront.__index = StoreFront
StoreFront.className = "StoreFront"

function StoreFront:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.directory = Directory.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.abPathUtil = AbPathUtil.getInstance()
    self.name = self.stringUtil.EMPTY_STRING
    self.basketName = self.stringUtil.EMPTY_STRING
    self.homeHostName = self.stringUtil.EMPTY_STRING
    self.homeHostNamePath = self.abPathUtil.NO_ABPATH
    self.hostName = self.stringUtil.EMPTY_STRING
    self.hostNamePath = self.abPathUtil.NO_ABPATH
    self.testHomeHostName = self.stringUtil.EMPTY_STRING
    self.testHomeHostNamePath = self.abPathUtil.NO_ABPATH
    self.testHostName = self.stringUtil.EMPTY_STRING
    self.testHostNamePath = self.abPathUtil.NO_ABPATH
    self.imagePath = self.abPathUtil.NO_ABPATH
    self.staticPath = self.abPathUtil.NO_ABPATH
    self.categoryPath = self.abPathUtil.NO_ABPATH
    self.inventoryControl = self.stringUtil.EMPTY_STRING
    self.contextConfigurationInterface = nil
    self.subStores = self.stringUtil.EMPTY_STRING
    self.tagLocation = self.stringUtil.EMPTY_STRING
    self.packageLocation = self.stringUtil.EMPTY_STRING
    self.ftp = self.stringUtil.EMPTY_STRING
    self.ftpPath = self.abPathUtil.NO_ABPATH
    self.ftpUserName = self.stringUtil.EMPTY_STRING
    self.ftpPassword = self.stringUtil.EMPTY_STRING
    self.testFtp = self.stringUtil.EMPTY_STRING
    self.testFtpPath = self.abPathUtil.NO_ABPATH
    self.testFtpUserName = self.stringUtil.EMPTY_STRING
    self.testFtpPassword = self.stringUtil.EMPTY_STRING
    self.timeCreated = self.stringUtil.EMPTY_STRING
    self.lastModified = self.stringUtil.EMPTY_STRING
    self.MINCHAR = 0
    self.MINSTORENAMELENGTH = 1
    self.MAXCHAR = 255
    self.EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
    self.ONE_EMPTY_STRING_ARRAY = StringUtil.getInstance().ONE_EMPTY_STRING_ARRAY
end

function StoreFront.new(...)
    local count = select("#", ...)
    if count == 0 then return StoreFront._new0(...)
    elseif count == 1 then return StoreFront._new1(...)
    elseif count == 1 then return StoreFront._new1(...)
    end
end


function StoreFront._new0()
    local self = setmetatable({}, StoreFront)
    self:_init_fields()
        self.contextConfigurationInterface = ContextConfiguration.new()
    return self
end


function StoreFront._new1(request)
    local self = setmetatable({}, StoreFront)
    self:_init_fields()
        self:getFormData(RequestParams.new(request):toHashMap())
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            self.logUtil:putF("TWB- needs update for adding and updating context configuration - currently defaults to admin context config", self, "StoreFront")
        end
        self:setContextConfigurationInterface(ContextConfigurationInterfaceFactory.getInstance():getInstance("Admin"))
    return self
end


function StoreFront._new1(hashMap)
    local self = setmetatable({}, StoreFront)
    self:_init_fields()
        self:getFormData(hashMap)
        local domDocumentString = hashMap:get(StoreFrontData.getInstance().CONFIGURATION)
        if domDocumentString == nil then
            local document = DomDocumentHelper.create(domDocumentString)
            self:setContextConfigurationInterface(ContextConfigurationInterfaceFactory.getInstance():getInstance(document))
        end
    return self
end


function StoreFront:isColumn(columnName)
        if ((columnName < StoreFrontData.getInstance().NAME and -1) or (columnName > StoreFrontData.getInstance().NAME and 1) or 0) == 0 or ((columnName < UserData.MAINEMAIL and -1) or (columnName > UserData.MAINEMAIL and 1) or 0) == 0 then
            return true
        else
            return false
        end
end


-- throws Exception
function StoreFront:createPath(key, hashMap)
        return AbPath.new(self:create(self.EMPTY_STRING, key, hashMap), StringUtil.getInstance().EMPTY_STRING)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function StoreFront:createPath(append, key, hashMap)
        return AbPath.new(self:create(append, key, hashMap), StringUtil.getInstance().EMPTY_STRING)
end


function StoreFront:get(key, hashMap)
        return self:create(self.EMPTY_STRING, key, hashMap)
end


function StoreFront:create(append, key, hashMap)
        local path = hashMap:get(key)
        if StringValidationUtil.getInstance():isEmpty(path) then
            return self.EMPTY_STRING
        else
            if self:isColumn(path) then
                return tostring(hashMap:get(path)) .. append
            else
                return path
            end
        end
end


-- throws Exception
function StoreFront:getFormData(storeHashMap)
        local storeFrontData = StoreFrontData.getInstance()
        self.name = storeHashMap:get(storeFrontData.NAME)
        self.basketName = storeHashMap:get(storeFrontData.NAME)
        self.homeHostName = storeHashMap:get(storeFrontData.HOMEHOSTNAME)
        self.homeHostNamePath = self:createPath(storeFrontData.HOMEHOSTNAMEPATH, storeHashMap)
        self.hostName = storeHashMap:get(storeFrontData.HOSTNAME)
        self.hostNamePath = self:createPath(storeFrontData.HOSTNAMEPATH, storeHashMap)
        self.testHomeHostName = storeHashMap:get(storeFrontData.TESTHOMEHOSTNAME)
        self.testHomeHostNamePath = self:createPath(storeFrontData.TESTHOMEHOSTNAMEPATH, storeHashMap)
        self.testHostName = storeHashMap:get(storeFrontData.TESTHOSTNAME)
        self.testHostNamePath = self:createPath(storeFrontData.TESTHOSTNAMEPATH, storeHashMap)
        self.imagePath = self:createPath(StoreFront.RESOURCES, storeFrontData.IMAGEPATH, storeHashMap)
        self.staticPath = self:createPath(" Products" .. tostring(AbPathData.getInstance().SEPARATOR), storeFrontData.STATICPATH, storeHashMap)
        self.categoryPath = self:createPath(StoreFront.RESOURCES, storeFrontData.CATEGORYPATH, storeHashMap)
        self.inventoryControl = storeHashMap:get(storeFrontData.INVENTORYCONTROL)
        self.subStores = storeHashMap:get(storeFrontData.SUBSTORES)
        self.tagLocation = storeHashMap:get(storeFrontData.TAGLOCATION)
        self.packageLocation = storeHashMap:get(storeFrontData.PACKAGELOCATION)
        self.ftp = storeHashMap:get(storeFrontData.FTP)
        self.ftpPath = self:createPath(storeFrontData.FTPPATH, storeHashMap)
        self.ftpUserName = storeHashMap:get(storeFrontData.FTPUSERNAME)
        self.ftpPassword = storeHashMap:get(storeFrontData.FTPPASSWORD)
        self.testFtp = storeHashMap:get(storeFrontData.TESTFTP)
        self.testFtpPath = self:createPath(storeFrontData.TESTFTPPATH, storeHashMap)
        self.testFtpUserName = storeHashMap:get(storeFrontData.TESTFTPUSERNAME)
        self.testFtpPassword = storeHashMap:get(storeFrontData.TESTFTPPASSWORD)
        self.timeCreated = storeHashMap:get(EntryData.getInstance().TIMECREATED)
        self.lastModified = storeHashMap:get(EntryData.getInstance().LASTMODIFIED)
end


function StoreFront:isNameValid()
        if not StringValidationUtil.getInstance():isValidRequired(self.name, self.MINSTORENAMELENGTH, self.MAXCHAR) then
            return false
        else
            local isEscapedCharactersContained = false
            local storeNameEscaped = StringEscapeUtils.escapeHtml3(self.name)
            if ((self.name < storeNameEscaped and -1) or (self.name > storeNameEscaped and 1) or 0) ~= 0 then
                isEscapedCharactersContained = true
            end
            local stringValidationUtil = StringValidationUtil.getInstance()
            local isSpacesContained = false
            if stringValidationUtil:containsSpaces(self.name) then
                isSpacesContained = true
            end
            if isSpacesContained or isEscapedCharactersContained then
                local hashMap = SpecialCharacterUtil.getHashMap()
                hashMap:put({CommonSeps.getInstance().SPACE}, self.ONE_EMPTY_STRING_ARRAY)
                self.name = Replace.new(hashMap):all(self.name)
            end
        end
        return true
end


function StoreFront:isValid()
        local valid = true
        valid = self:isNameValid()
        local stringValidationUtil = StringValidationUtil.getInstance()
        if not stringValidationUtil:isValidRequired(self.basketName, self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidRequired(self.homeHostName, self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidNotRequired(tostring(self.homeHostNamePath), self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidRequired(self.hostName, self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidRequired(tostring(self.hostNamePath), self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.testHomeHostName, self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidNotRequired(tostring(self.testHomeHostNamePath), self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.testHostName, self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidNotRequired(tostring(self.testHostNamePath), self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidRequired(tostring(self.imagePath), self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidRequired(tostring(self.staticPath), self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidRequired(tostring(self.categoryPath), self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidRequired(self.inventoryControl, self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.subStores, self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.tagLocation, self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidRequired(self.packageLocation, self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.ftp, self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidNotRequired(tostring(self.ftpPath), self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.ftpUserName, self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.ftpPassword, self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.testFtp, self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidNotRequired(tostring(self.testFtpPath), self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.testFtpUserName, self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.testFtpPassword, self.MINCHAR, self.MAXCHAR) then
            valid = false
        end
        if valid == true then
            return true
        else
            return false
        end
end


function StoreFront:nameValidationInfo()
        local stringValidationUtil = StringValidationUtil.getInstance()
        if not stringValidationUtil:isValidRequired(self.name, self.MINCHAR, self.MAXCHAR) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Name is invalid. Must be < ")
            stringBuffer:appendint(self.MAXCHAR)
            stringBuffer:append(" and > 0 characters.<br>")
            return tostring(stringBuffer)
        end
        return self.EMPTY_STRING
end


function StoreFront:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringValidationUtil = StringValidationUtil.getInstance()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self:nameValidationInfo())
            if not stringValidationUtil:isValidRequired(self.basketName, self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Basket name is invalid. Must be < ")
                stringBuffer:appendint(self.MAXCHAR)
                stringBuffer:append(" and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidRequired(self.homeHostName, self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Home host name is invalid. Must be < ")
                stringBuffer:appendint(self.MAXCHAR)
                stringBuffer:append(" and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidNotRequired(tostring(self.homeHostNamePath), self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Home host name path is invalid. Must be < ")
                stringBuffer:appendint(self.MAXCHAR)
                stringBuffer:append(" and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidRequired(self.hostName, self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Host name is invalid. Must be < ")
                stringBuffer:appendint(self.MAXCHAR)
                stringBuffer:append(" and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidRequired(tostring(self.hostNamePath), self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Host name path is invalid. Must be < ")
                stringBuffer:appendint(self.MAXCHAR)
                stringBuffer:append(" and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidNotRequired(self.testHomeHostName, self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Test home host name is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidNotRequired(tostring(self.testHomeHostNamePath), self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Test home host name path is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidNotRequired(self.testHostName, self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Test host name is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidNotRequired(tostring(self.testHostNamePath), self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Test host name path is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidRequired(tostring(self.imagePath), self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Image path is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidRequired(tostring(self.staticPath), self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Static path is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidRequired(tostring(self.categoryPath), self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Category path is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidRequired(self.inventoryControl, self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Inventory control is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidNotRequired(self.subStores, self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Sub stores is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidNotRequired(self.tagLocation, self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Tag location is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidRequired(self.packageLocation, self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Package location is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidNotRequired(self.ftp, self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Ftp is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidNotRequired(tostring(self.ftpPath), self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Ftp path is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidNotRequired(self.ftpUserName, self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Ftp username is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidNotRequired(self.ftpPassword, self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Ftp password is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidNotRequired(self.testFtp, self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Test ftp is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidNotRequired(tostring(self.testFtpPath), self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Test ftp Path is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidNotRequired(self.testFtpUserName, self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Test ftp username is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            if not stringValidationUtil:isValidNotRequired(self.testFtpPassword, self.MINCHAR, self.MAXCHAR) then
                stringBuffer:append("Test ftp password is invalid. Must be < " .. tostring(self.MAXCHAR) .. " and > 0 characters.<br>")
            end
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
end


function StoreFront:getTestHtmlPath()
        return org.allbinary.globals.URLGLOBALS:getTestHtmlPath() + self:getCurrentHostNamePath()
end


function StoreFront:getCurrentHostName()
        local location = self.EMPTY_STRING
        if org.allbinary.globals.URLGLOBALS:isTestingMode() then
            location = self:getTestHostName()
        else
            location = self:getHostName()
        end
        return location
end


function StoreFront:getCurrentHostNamePath()
        local location = self.EMPTY_STRING
        if org.allbinary.globals.URLGLOBALS:isTestingMode() then
            location = self:getTestHostNamePath()
        else
            location = self:getHostNamePath()
        end
        return location
end


function StoreFront:getCurrentHomeHostName()
        local location = self.EMPTY_STRING
        if org.allbinary.globals.URLGLOBALS:isTestingMode() then
            location = self:getTestHomeHostName()
        else
            location = self:getHomeHostName()
        end
        return location
end


function StoreFront:getCurrentHomeHostNamePath()
        local location = self.EMPTY_STRING
        if org.allbinary.globals.URLGLOBALS:isTestingMode() then
            location = self:getTestHomeHostNamePath()
        else
            location = self:getHomeHostNamePath()
        end
        return location
end


function StoreFront:getName()
        return self.name
end


function StoreFront:getBasketName()
        return self.basketName
end


function StoreFront:getHomeHostName()
        return self.homeHostName
end


function StoreFront:getHomeHostNamePath()
        return tostring(self.homeHostNamePath)
end


function StoreFront:getHostName()
        return self.hostName
end


function StoreFront:getHostNamePath()
        return tostring(self.hostNamePath)
end


function StoreFront:getTestHomeHostName()
        return self.testHomeHostName
end


function StoreFront:getTestHomeHostNamePath()
        return tostring(self.testHomeHostNamePath)
end


function StoreFront:getTestHostName()
        return self.testHostName
end


function StoreFront:getTestHostNamePath()
        return tostring(self.testHostNamePath)
end


function StoreFront:getStaticPath()
        return tostring(self.staticPath)
end


function StoreFront:getCategoryPath()
        return tostring(self.categoryPath)
end


function StoreFront:getInventoryControl()
        return self.inventoryControl
end


-- throws Exception
function StoreFront:getSubStores()
        local try_ok, try_error = pcall(function()
            local tokenizer = Tokenizer.new(CommonSeps.getInstance().SEMICOLON)
            local subStoreVector = tokenizer:getTokensFromString(self.subStores, BasicArrayListD.new())
            return subStoreVector
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


function StoreFront:getTagLocation()
        return self.tagLocation
end


function StoreFront:getPackageLocation()
        return self.packageLocation
end


function StoreFront:getFtp()
        return self.ftp
end


function StoreFront:getFtpUserName()
        return self.ftpUserName
end


function StoreFront:getFtpPassword()
        return self.ftpPassword
end


function StoreFront:getTestFtp()
        return self.testFtp
end


function StoreFront:getTestFtpUserName()
        return self.testFtpUserName
end


function StoreFront:getTestFtpPassword()
        return self.testFtpPassword
end


function StoreFront:getFtpPath()
        return tostring(self.ftpPath)
end


function StoreFront:getTestFtpPath()
        return tostring(self.testFtpPath)
end


function StoreFront:getTimeCreated()
        return self.timeCreated
end


function StoreFront:getLastModified()
        return self.lastModified
end


function StoreFront:setName(value)
        self.name = value
end


function StoreFront:setBasketName(value)
        self.basketName = value
end


function StoreFront:setHomeHostName(value)
        self.homeHostName = value
end


-- throws Exception
function StoreFront:setHomeHostNamePath(value)
        self.homeHostNamePath = AbPath.new(value, StringUtil.getInstance().EMPTY_STRING)
end


function StoreFront:setHostName(value)
        self.hostName = value
end


-- throws Exception
function StoreFront:setHostNamePath(value)
        self.hostNamePath = AbPath.new(value, StringUtil.getInstance().EMPTY_STRING)
end


function StoreFront:setTestHomeHostName(value)
        self.testHomeHostName = value
end


-- throws Exception
function StoreFront:setTestHomeHostNamePath(value)
        self.testHomeHostNamePath = AbPath.new(value, StringUtil.getInstance().EMPTY_STRING)
end


function StoreFront:setTestHostName(value)
        self.testHostName = value
end


-- throws Exception
function StoreFront:setTestHostNamePath(value)
        self.testHostNamePath = AbPath.new(value, StringUtil.getInstance().EMPTY_STRING)
end


-- throws Exception
function StoreFront:setImagePath(value)
        self.imagePath = AbPath.new(value, StringUtil.getInstance().EMPTY_STRING)
end


-- throws Exception
function StoreFront:setStaticPath(value)
        self.staticPath = AbPath.new(value, StringUtil.getInstance().EMPTY_STRING)
end


-- throws Exception
function StoreFront:setCategoryPath(value)
        self.categoryPath = AbPath.new(value, StringUtil.getInstance().EMPTY_STRING)
end


function StoreFront:setSubStores(value)
        self.subStores = value
end


function StoreFront:setTagLocation(value)
        self.tagLocation = value
end


function StoreFront:setPackageLocation(value)
        self.packageLocation = value
end


function StoreFront:setInventoryControl(value)
        self.inventoryControl = value
end


-- Java overloaded method: Lua keeps the last definition
function StoreFront:getPackageLocation(value)
        self.packageLocation = value
end


function StoreFront:setFtp(value)
        self.ftp = value
end


function StoreFront:setFtpUserName(value)
        self.ftpUserName = value
end


function StoreFront:setFtpPassword(value)
        self.ftpPassword = value
end


function StoreFront:setTestFtp(value)
        self.testFtp = value
end


function StoreFront:setTestFtpUserName(value)
        self.testFtpUserName = value
end


function StoreFront:setTestFtpPassword(value)
        self.testFtpPassword = value
end


function StoreFront:setTimeCreated(value)
        self.timeCreated = value
end


function StoreFront:setLastModified(value)
        self.lastModified = value
end


-- throws Exception
function StoreFront:setFtpPath(value)
        self.ftpPath = AbPath.new(value, StringUtil.getInstance().EMPTY_STRING)
end


-- throws Exception
function StoreFront:setTestFtpPath(value)
        self.testFtpPath = AbPath.new(value, StringUtil.getInstance().EMPTY_STRING)
end


-- throws Exception
function StoreFront:createDirectories()
        local storeAbPath = AbPath.new(self.URLGLOBALS:getWebappPath() + self:getCurrentHomeHostNamePath(), StringUtil.getInstance().EMPTY_STRING)
        if not self.directory:create(storeAbPath) then
            return false
        end
        if not self.directory:create(AbPath.new(storeAbPath + self:getCategoryPath(), StringUtil.getInstance().EMPTY_STRING)) then
            return false
        end
        if not self.directory:create(AbPath.new(storeAbPath + self:getStaticPath(), StringUtil.getInstance().EMPTY_STRING)) then
            return false
        end
        return true
end


-- throws Exception
function StoreFront:install(current, total)
        local try_ok, try_error = pcall(function()
            if not self:createDirectories() then
                error(java_exception("Exception", "Unable to create store directories"), 0)
            end
            local stringBuffer = StringMaker.new()
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append(self.URLGLOBALS:getMainPath())
            stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH)
            local viewPath = tostring(stringBuffer)
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append(viewPath)
            stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().INSTALLPATH)
            local fromDirectoryAbPath = AbPath.new(tostring(stringBuffer), StringUtil.getInstance().EMPTY_STRING)
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append(viewPath)
            stringBuffer:append("special")
            stringBuffer:append(AbPathData.getInstance().SEPARATOR)
            local fromSpecialDirectoryAbPath = AbPath.new(tostring(stringBuffer), StringUtil.getInstance().EMPTY_STRING)
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append(viewPath)
            stringBuffer:append(self:getName())
            stringBuffer:append(AbPathData.getInstance().SEPARATOR)
            local toDirectoryAbPath = AbPath.new(tostring(stringBuffer), StringUtil.getInstance().EMPTY_STRING)
            if current == 0 then
                if not self.directory:create(toDirectoryAbPath) then
                    error(java_exception("Exception", "Unable to create store view directory: " .. tostring(toDirectoryAbPath)), 0)
                end
            end
            local viewTotal = java_idiv((total * 85), 100)
            local installTotal = java_idiv((total * 93), 100)
            if current < viewTotal then
                local file = AbFile.createAbFileFromAbPath(fromSpecialDirectoryAbPath)
                if file:isDirectory() then
                    local halfViewTotal = java_idiv(viewTotal, 2)
                    if current < halfViewTotal then
                        self:installViews(fromSpecialDirectoryAbPath, toDirectoryAbPath, current, halfViewTotal)
                    elseif current < viewTotal then
                        self:installViews(fromDirectoryAbPath, toDirectoryAbPath, current - halfViewTotal, viewTotal - halfViewTotal)
                    end
                else
                    self:installViews(fromDirectoryAbPath, toDirectoryAbPath, current, viewTotal)
                end
            elseif current < installTotal then
                self:installResources(fromDirectoryAbPath, current - viewTotal, installTotal - viewTotal)
            else
                self:installMedia(fromDirectoryAbPath, current - installTotal, total - installTotal)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "install()", e)
            end
            error(e, 0)
        end
end


-- throws Exception
function StoreFront:installViews(fromDirectoryAbPath, toDirectoryAbPath, current, total)
        FileUtil.getInstance():copyDirectoryPortion(fromDirectoryAbPath, toDirectoryAbPath, true, false, current, total)
end


-- throws Exception
function StoreFront:installResources(fromDirectoryAbPath, current, total)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(fromDirectoryAbPath))
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        stringBuffer:append("Resources")
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        local installCategoryAbPath = AbPath.new(tostring(stringBuffer), StringUtil.getInstance().EMPTY_STRING)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(self.URLGLOBALS:getMainPath())
        stringBuffer:append(self:getCurrentHomeHostNamePath())
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        stringBuffer:append(self:getCategoryPath())
        local categoryAbPath = AbPath.new(tostring(stringBuffer), StringUtil.getInstance().EMPTY_STRING)
        FileUtil.getInstance():copyDirectoryPortion(installCategoryAbPath, categoryAbPath, true, false, current, total)
end


-- throws Exception
function StoreFront:installMedia(fromDirectoryAbPath, current, total)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(fromDirectoryAbPath))
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().TEMPLATEPATH)
        stringBuffer:append("images")
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        local viewStoreImagesDirectoryAbPath = AbPath.new(tostring(stringBuffer), StringUtil.getInstance().EMPTY_STRING)
        local storeAbPath = AbPath.new(self.URLGLOBALS:getWebappPath() + self:getCurrentHomeHostNamePath(), StringUtil.getInstance().EMPTY_STRING)
        FileUtil.getInstance():copyDirectoryPortion(viewStoreImagesDirectoryAbPath, storeAbPath, true, false, current, total)
end


-- throws Exception
function StoreFront:toVector()
        local dataVector = BasicArrayListD.new()
        dataVector:add(self.name)
        dataVector:add(self.homeHostName)
        dataVector:add(tostring(self.homeHostNamePath))
        dataVector:add(self.hostName)
        dataVector:add(tostring(self.hostNamePath))
        dataVector:add(self.testHomeHostName)
        dataVector:add(tostring(self.testHomeHostNamePath))
        dataVector:add(self.testHostName)
        dataVector:add(tostring(self.testHostNamePath))
        dataVector:add(tostring(self.imagePath))
        dataVector:add(tostring(self.staticPath))
        dataVector:add(tostring(self.categoryPath))
        dataVector:add(self.inventoryControl)
        local contextConfigurationDomDocumentMapping = ContextConfigurationDomDocumentMapping.new(self:getContextConfigurationInterface())
        dataVector:add(contextConfigurationDomDocumentMapping:toDomDocumentString())
        dataVector:add(self.subStores)
        dataVector:add(self.tagLocation)
        dataVector:add(self.packageLocation)
        dataVector:add(self.ftp)
        dataVector:add(tostring(self.ftpPath))
        dataVector:add(self.ftpUserName)
        dataVector:add(self.ftpPassword)
        dataVector:add(self.testFtp)
        dataVector:add(tostring(self.testFtpPath))
        dataVector:add(self.testFtpUserName)
        dataVector:add(self.testFtpPassword)
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        dataVector:add(time)
        dataVector:add(time)
        return dataVector
end


-- throws Exception
function StoreFront:toHashMap()
        local storeFrontData = StoreFrontData.getInstance()
        local dataHashMap = StdUtil.getInstance():createHashMap()
        dataHashMap:put(storeFrontData.NAME, self.name)
        dataHashMap:put(storeFrontData.HOMEHOSTNAME, self.homeHostName)
        dataHashMap:put(storeFrontData.HOMEHOSTNAMEPATH, tostring(self.homeHostNamePath))
        dataHashMap:put(storeFrontData.HOSTNAME, self.hostName)
        dataHashMap:put(storeFrontData.HOSTNAMEPATH, tostring(self.hostNamePath))
        dataHashMap:put(storeFrontData.TESTHOMEHOSTNAME, self.testHomeHostName)
        dataHashMap:put(storeFrontData.TESTHOMEHOSTNAMEPATH, tostring(self.testHomeHostNamePath))
        dataHashMap:put(storeFrontData.TESTHOSTNAME, self.testHostName)
        dataHashMap:put(storeFrontData.TESTHOSTNAMEPATH, tostring(self.testHostNamePath))
        dataHashMap:put(storeFrontData.IMAGEPATH, tostring(self.imagePath))
        dataHashMap:put(storeFrontData.STATICPATH, tostring(self.staticPath))
        dataHashMap:put(storeFrontData.CATEGORYPATH, tostring(self.categoryPath))
        dataHashMap:put(storeFrontData.INVENTORYCONTROL, self.inventoryControl)
        local contextConfigurationDomDocumentMapping = ContextConfigurationDomDocumentMapping.new(self:getContextConfigurationInterface())
        dataHashMap:put(storeFrontData.CONFIGURATION, contextConfigurationDomDocumentMapping:toDomDocumentString())
        dataHashMap:put(storeFrontData.SUBSTORES, self.subStores)
        dataHashMap:put(storeFrontData.TAGLOCATION, self.tagLocation)
        dataHashMap:put(storeFrontData.PACKAGELOCATION, self.packageLocation)
        dataHashMap:put(storeFrontData.FTP, self.ftp)
        dataHashMap:put(storeFrontData.FTPPATH, tostring(self.ftpPath))
        dataHashMap:put(storeFrontData.FTPUSERNAME, self.ftpUserName)
        dataHashMap:put(storeFrontData.FTPPASSWORD, self.ftpPassword)
        dataHashMap:put(storeFrontData.TESTFTP, self.testFtp)
        dataHashMap:put(storeFrontData.TESTFTPPATH, tostring(self.testFtpPath))
        dataHashMap:put(storeFrontData.TESTFTPUSERNAME, self.testFtpUserName)
        dataHashMap:put(storeFrontData.TESTFTPPASSWORD, self.testFtpPassword)
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        dataHashMap:put(EntryData.getInstance().LASTMODIFIED, time)
        return dataHashMap
end


function StoreFront:getKey()
        return self:getName()
end


function StoreFront:getContextConfigurationInterface()
        return self.contextConfigurationInterface
end


function StoreFront:setContextConfigurationInterface(contextConfigurationInterface)
        self.contextConfigurationInterface = contextConfigurationInterface
end

StoreFront.RESOURCES = " Resources" .. tostring(AbPathData.getInstance().SEPARATOR)

return StoreFront

