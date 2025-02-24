#include "pch.h"
#include "model_embed.h"
#include "model.h" // 包含生成的数据

const unsigned char* get_model_data() {
    const unsigned char* yolomodel_content = yolomodel;
    return yolomodel_content;
}

size_t get_model_size() {
    const size_t model_size = yolomodel_size;
    return model_size;
}