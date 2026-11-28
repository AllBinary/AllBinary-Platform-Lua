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
-- package org.allbinary.input.automation.module.osgi

local InputAutomationNewBundleRunnable = {}
package.loaded["org.allbinary.input.automation.module.osgi.InputAutomationNewBundleRunnable"] = InputAutomationNewBundleRunnable

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

local File = java_lazy("java.io.File")
-- local FileFilter = require("java.io.FileFilter")
local FileInputStream = java_lazy("java.io.FileInputStream")
-- local URL = require("java.net.URL")
local HashMap = java_lazy("java.util.HashMap")
-- local Set = require("java.util.Set")
-- local JarInputStream = require("java.util.jar.JarInputStream")
local Manifest = java_lazy("java.util.jar.Manifest")
local Bundle = java_lazy("org.osgi.framework.Bundle")
local BundleContext = java_lazy("org.osgi.framework.BundleContext")
local Constants = java_lazy("org.osgi.framework.Constants")
local InputAutomationBundleActivator = java_lazy("bundle.input.automation.InputAutomationBundleActivator")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local FileWrapperUtil = java_lazy("org.allbinary.logic.io.file.FileWrapperUtil")
local SubDirectory = java_lazy("org.allbinary.logic.io.file.directory.SubDirectory")
local BasicFileFilterUtil = java_lazy("org.allbinary.logic.io.file.filter.BasicFileFilterUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local RunnableInterface = java_lazy("org.allbinary.thread.RunnableInterface")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table InputAutomationNewBundleRunnable is declared before the requires
InputAutomationNewBundleRunnable.__index = InputAutomationNewBundleRunnable
InputAutomationNewBundleRunnable.className = "InputAutomationNewBundleRunnable"
InputAutomationNewBundleRunnable.javaClassName = "org.allbinary.input.automation.module.osgi.InputAutomationNewBundleRunnable"
InputAutomationNewBundleRunnable.java_implements = " RunnableInterface "
InputAutomationNewBundleRunnable.java_interfaces = function() return {RunnableInterface} end

function InputAutomationNewBundleRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.inputAutomationBundleActivator == nil then self.inputAutomationBundleActivator = nil end
    if self.running == nil then self.running = false end
    if self.fileBasicArrayList == nil then self.fileBasicArrayList = nil end
end


function InputAutomationNewBundleRunnable._jinit(self, inputAutomationBundleActivator)
    InputAutomationNewBundleRunnable._init_fields(self)
        self.inputAutomationBundleActivator = inputAutomationBundleActivator
        self.fileBasicArrayList = BasicArrayListD.new()
    return self
end

function InputAutomationNewBundleRunnable.new(...)
    local self = setmetatable({}, InputAutomationNewBundleRunnable)
    InputAutomationNewBundleRunnable._jinit(self, ...)
    return self
end


-- throws Exception
function InputAutomationNewBundleRunnable:setThread(thread)
end


function InputAutomationNewBundleRunnable:isRunning()
        return self.running
end


function InputAutomationNewBundleRunnable:setRunning(running)
        self.running = running
end


-- throws Exception
function InputAutomationNewBundleRunnable:updateModules()
        self.logUtil:putF(self.commonStrings.START, self, "updateModules")
        local list = self:findNewModules()
        local size = list:size()
        local bundle = nil
        for index = 0, size - 1 do
            bundle = self:install(list:get(index))
            if not rawequal(bundle, nil) then
                bundle:start(InputAutomationNewBundleRunnable.MODULES_START_LEVEL)
            end
        end
end


-- throws Exception
function InputAutomationNewBundleRunnable:getAllJarSymbolicNameHashMap()
        self.logUtil:putF(self.commonStrings.START, self, "getAllJarSymbolicNameHashMap")
        local hashMap = StdUtil.getInstance():createHashMap()
        local jarFileBasicArrayList = self:getJarModuleFileBasicArrayList()
        self.logUtil:putF(require("allbinary_java").to_string("Jar Module Files: ") .. require("allbinary_java").to_string(jarFileBasicArrayList), self, "getAllJarSymbolicNameHashMap")
        local size = jarFileBasicArrayList:size()
        local file = nil
        for index = 0, size - 1 do
            file = jarFileBasicArrayList:get(index)
            if not (file:isDirectory()) then
                local fileInputStream = FileInputStream.new(file)
                local jarInputStream = JarInputStream.new(fileInputStream)
                local manifest = jarInputStream:getManifest()
                if rawequal(manifest, nil) then
                else
                    local symbolicName = manifest:getMainAttributes():getValue(Constants.BUNDLE_SYMBOLICNAME)
                    if not rawequal(symbolicName, nil) then
                        hashMap:put(symbolicName, URL.new(InputAutomationNewBundleRunnable.FILE + file:getAbsolutePath()))
                    end
                end
            end
        end
        return hashMap
end


function InputAutomationNewBundleRunnable:getJarModuleFileBasicArrayList()
        self.logUtil:putF(self.commonStrings.START, self, "getJarModuleFileBasicArrayList")
        local baseJarPath = require("java.lang.System").getProperty(InputAutomationNewBundleRunnable.JAR_DIR_PROP)
        if (string.sub(baseJarPath, 1, #InputAutomationNewBundleRunnable.FILE) == InputAutomationNewBundleRunnable.FILE) then
            baseJarPath = string.sub(baseJarPath, (InputAutomationNewBundleRunnable.FILE:length()) + 1)
        end
        local jarFileFilter = BasicFileFilterUtil.getInstance(".jar")
        local path = require("allbinary_java").to_string(baseJarPath) .. require("allbinary_java").to_string(InputAutomationNewBundleRunnable.INPUT_AUTMATION_MODULE_BUNDLE_JAR_PATH)
        self.logUtil:putF(require("allbinary_java").to_string("Path: ") .. require("allbinary_java").to_string(path), self, "getJarModuleFileBasicArrayList")
        local file = File.new(path)
        self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("File: ") .. require("allbinary_java").to_string(file:getAbsolutePath())) .. require("allbinary_java").to_string(" isDirectory: ")) .. require("allbinary_java").to_string(file:isDirectory()), self, "getJarModuleFileBasicArrayList")
        return SubDirectory.getInstance():search(jarFileFilter, FileWrapperUtil.wrapFile(file))
end


-- throws Exception
function InputAutomationNewBundleRunnable:getInstalledJarSymbolicNameBasicArrayList()
        self.logUtil:putF(self.commonStrings.START, self, "getInstalledJarSymbolicNameBasicArrayList")
        local vector = BasicArrayListD.new()
        local bundleContext = InputAutomationBundleActivator.getBundleContext()
        local bundleArray = bundleContext:getBundles()
        if not rawequal(bundleArray, nil) then
            self.logUtil:putF(require("allbinary_java").to_string("bundleArray: ") .. require("allbinary_java").to_string((bundleArray.n or #bundleArray)), self, "getInputAutomationModuleServices")
            for index = 0, (bundleArray.n or #bundleArray) - 1 do
                local bundle = bundleArray[index + 1]
                vector:add(bundle:getSymbolicName())
            end
        end
        return vector
end


-- throws Exception
function InputAutomationNewBundleRunnable:isInstalled(symbolicName)
        self.logUtil:putF(require("allbinary_java").to_string(CommonLabels.getInstance().START) .. require("allbinary_java").to_string(symbolicName), self, "isInstalled")
        local list = self:getInstalledJarSymbolicNameBasicArrayList()
        local size = list:size()
        local nextSymbolicName = nil
        for index = 0, size - 1 do
            nextSymbolicName = list:get(index)
            if rawequal(((nextSymbolicName < symbolicName and -1) or (nextSymbolicName > symbolicName and 1) or 0), 0) then
                return true
            end
        end
        return false
end


-- throws Exception
function InputAutomationNewBundleRunnable:findNewModules()
        self.logUtil:putF(self.commonStrings.START, self, "findNewModules")
        local vector = BasicArrayListD.new()
        local hashMap = self:getAllJarSymbolicNameHashMap()
        self.logUtil:putF(require("allbinary_java").to_string("All: ") .. require("allbinary_java").to_string(hashMap), self, "findNewModules")
        local set = hashMap:keySet()
        local symbolicNameArray = set:toArray()
        local size = (symbolicNameArray.n or #symbolicNameArray)
        for index = 0, size - 1 do
            local symbolicName = symbolicNameArray[index + 1]
            if not (self:isInstalled(symbolicName)) then
                vector:add(hashMap:get(symbolicName))
            end
        end
        return vector
end


-- throws Exception
function InputAutomationNewBundleRunnable:install(url)
        self.logUtil:putF(CommonLabels.getInstance().START + url, self, "install")
        local bundleContext = InputAutomationBundleActivator.getBundleContext()
        return bundleContext:installBundle(tostring(url))
end


function InputAutomationNewBundleRunnable:run()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            while self:isRunning() do
                timeHelper:setStartTimeTNT()
                self.logUtil:putF(CommonLabels.getInstance().ELAPSED + timeHelper:getElapsedTNT(), self, self.commonStrings.RUN)
                self:updateModules()
                break
            end
            self.logUtil:putF(self.commonStrings.END, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

InputAutomationNewBundleRunnable.FILE = "file:"
InputAutomationNewBundleRunnable.JAR_DIR_PROP = "org.knopflerfish.gosg.jars"
InputAutomationNewBundleRunnable.INPUT_AUTMATION_MODULE_BUNDLE_JAR_PATH = "ia/auto"
InputAutomationNewBundleRunnable.MODULES_START_LEVEL = 8

return InputAutomationNewBundleRunnable

