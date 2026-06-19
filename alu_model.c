void alu_model(uint8_t opcode, uint16_t A, uint16_t B, uint16_t* outfinal, uint8_t* neg, uint8_t* zero){
    
    *neg = 0;
    *zero = 0;

    switch(opcode){
        case 0: *outfinal = A + B;
        break;
        case 1: *outfinal = A - B;
        break;
        case 2: *outfinal = A & B;
        break;
        case 3: *outfinal = A | B;
        break;
        case 4: *outfinal = A ^ B;
        break;
        case 5: *outfinal = A << (B & 0xF);
        break;
        case 6: *outfinal = A >> (B & 0xF);
        break;
        case 7: *outfinal = A == B;
        break;
        default: *outfinal = 0;
        break;
    }

    if(*outfinal == 0){
        *zero = 1;
    }
    else if (*outfinal >> 15 == 1){
        *neg = 1;
    }
}