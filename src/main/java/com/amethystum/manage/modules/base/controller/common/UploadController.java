package com.amethystum.manage.modules.base.controller.common;

import com.amethystum.manage.common.utils.ResultUtil;
import com.amethystum.manage.common.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Amethystum
 */
@Slf4j
@RestController
@Api(description = "文件上传接口")
@RequestMapping("/xboot/upload")
@Transactional
public class UploadController {

//    @Autowired
//    private QiniuUtil qiniuUtil;

    @RequestMapping(value = "/file",method = RequestMethod.POST)
    @ApiOperation(value = "文件上传")
    public Result<Object> upload(@RequestParam(required = false) MultipartFile file,
                                 @RequestParam(required = false) String base64,
                                 HttpServletRequest request) {

//        if(!StringUtils.isEmpty(base64)){
//            // base64上传
//            file = Base64DecodeMultipartFile.base64Convert(base64);
//        }
        String result = null;
//        String fileName = qiniuUtil.renamePic(file.getOriginalFilename());
//        try {
//            InputStream inputStream = file.getInputStream();
//            //上传七牛云服务器
//            result = qiniuUtil.qiniuInputStreamUpload(inputStream,fileName);
//        } catch (Exception e) {
//            log.error(e.toString());
//            return new ResultUtil<Object>().setErrorMsg(e.toString());
//        }

        return new ResultUtil<Object>().setData(result);
    }
}
