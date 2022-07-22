vec4 raymarch(vec3 dir, vec3 pos, float iter, 
    float iterCnt, float rayLength) {
    step0 = pow(iter / iterCnt, 2);
    step1 = pow(iter + 1.0 / iterCnt, 2);

    realStep0 = step0 * raymarchLength;
    // Make sure to not overshoot raymarching distance 
    // in the last sample
    realStep1 = max(step1 * rayLength, rayLength);
    float rayShift = 
        realStep0 + (realStep1 - realStep) * 0.3;

    vec3 newPos = pos + rayShift * dir;
    float dt = realStep1 - realStep0;

    return vec4(newPos, dt);
}