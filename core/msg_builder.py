"""
core/msg_builder.py
Xây dựng nội dung tin nhắn rep chuỗi TikTok hỗ trợ đa ngôn ngữ (Tiếng Việt, Tiếng Anh, Song ngữ...)
"""

import os
import random
from datetime import datetime
from utils.config import get_config
from utils.hitokoto import request_hitokoto

# Danh sách tin nhắn giữ chuỗi Tiếng Việt
TIKTOK_STREAK_MESSAGES_VI = [
    "🔥 Duy trì chuỗi TikTok hôm nay nè! Chúc bạn ngày mới tốt lành ✨",
    "🔥 Tiếp tục chuỗi hỏa hoạn TikTok nha! Ngày mới tràn đầy năng lượng nhé 💪",
    "🔥 Rep chuỗi TikTok hôm nay nào! Chúc bạn một ngày thật may mắn 🍀",
    "🔥 Giữ chuỗi TikTok thôi nào! Have a wonderful day 🌟",
    "🔥 Ting ting! Điểm danh chuỗi TikTok ngày hôm nay 🚀",
    "🔥 Giữ lửa TikTok không để tắt nè bạn ơi! Chúc ngày mới vui vẻ 🎉",
    "🔥 Chuỗi TikTok hôm nay nè! Chúc bạn mọi điều suôn sẻ nha ❤️",
    "🔥 Rep chuỗi giữ lửa nè! Ngày mới an lành và nhiều niềm vui nhé 🌈",
    "🔥 Điểm danh chuỗi TikTok! Chúc bạn một ngày làm việc và học tập hiệu quả ☀️",
    "🔥 Tiếp tục chuỗi ngày rực rỡ nào! Luôn vui vẻ và yêu đời nhé 💖",
]

# Danh sách tin nhắn giữ chuỗi Tiếng Anh (English)
TIKTOK_STREAK_MESSAGES_EN = [
    "🔥 Keeping our TikTok streak alive! Have an amazing day ✨",
    "🔥 Streak check! Hope you have a wonderful day ahead 🚀",
    "🔥 Daily TikTok streak reminder! Stay awesome and blessed 🍀",
    "🔥 Keeping the fire burning on TikTok! Have a great one 🎉",
    "🔥 Don't let our streak end! Wishing you the best today 💖",
    "🔥 Here is our daily streak! Wishing you good vibes and positivity 🌟",
    "🔥 Daily streak update! Keep shining bright today ☀️",
    "🔥 Replying for our streak! Have a super productive day 💪",
    "🔥 Streak preserved! Hope something great happens to you today 🌈",
    "🔥 Fire streak on point! Sending you good energy 🥰",
]

# Danh sách tin nhắn Song ngữ (Bilingual: Tiếng Việt + Tiếng Anh)
TIKTOK_STREAK_MESSAGES_BILINGUAL = [
    "🔥 Giữ chuỗi TikTok hôm nay nha! • Keeping our streak alive ✨",
    "🔥 Điểm danh chuỗi TikTok nè! • Have a wonderful day 🌟",
    "🔥 Rep chuỗi giữ lửa TikTok! • Wishing you all the best today 🍀",
    "🔥 Tiếp tục chuỗi ngày rực rỡ nhé! • Stay awesome and blessed 💖",
    "🔥 Giữ lửa TikTok không để tắt nè! • Daily streak reminder 🎉",
]

RANDOM_EMOJIS = ["🔥", "⚡", "✨", "💖", "🎉", "🚀", "🍀", "🌟", "☀️", "🥰"]


def get_random_streak_message(lang: str = "vi") -> str:
    """Lấy ngẫu nhiên một câu tin nhắn giữ chuỗi theo ngôn ngữ đã chọn"""
    lang = lang.lower().strip()
    if lang in ["en", "english", "tieng_anh"]:
        return random.choice(TIKTOK_STREAK_MESSAGES_EN)
    elif lang in ["bilingual", "song_ngu", "vi_en"]:
        return random.choice(TIKTOK_STREAK_MESSAGES_BILINGUAL)
    else:
        return random.choice(TIKTOK_STREAK_MESSAGES_VI)


def build_message_with_openai() -> str:
    """
    Tạo tin nhắn giữ chuỗi thông minh qua OpenAI API (nếu có cấu hình)
    """
    config = get_config()
    openai_config = config.get("openai", {})
    api_key = os.getenv("OPENAI_API_KEY", openai_config.get("api_key", ""))
    model = openai_config.get("model", "gpt-4o-mini")
    lang = os.getenv("STREAK_LANGUAGE", config.get("streakLanguage", "vi"))

    if not api_key:
        return get_random_streak_message(lang)

    try:
        from openai import OpenAI
        client = OpenAI(api_key=api_key)
        response = client.chat.completions.create(
            model=model,
            messages=[
                {
                    "role": "system",
                    "content": (
                        f"Bạn là trợ lý giúp viết tin nhắn ngắn (dưới 20 từ) ngôn ngữ '{lang}' "
                        "để giữ chuỗi tương tác (streak) trên TikTok cho bạn bè hoặc nhóm chat. "
                        "Tin nhắn vui vẻ, thân thiện, kèm emoji lửa hoặc tim. "
                        "Chỉ xuất trực tiếp nội dung tin nhắn, không thêm dấu ngoặc kép."
                    ),
                },
                {"role": "user", "content": "Tạo một câu nhắn giữ chuỗi TikTok hôm nay"},
            ],
            max_tokens=60,
        )
        return response.choices[0].message.content.strip()
    except Exception as e:
        print(f"Lỗi gọi OpenAI API: {e}, chuyển sang dùng tin nhắn mặc định")
        return get_random_streak_message(lang)


def build_message(target_name: str = "") -> str:
    """
    Tạo tin nhắn gửi đi dựa trên cấu hình template hoặc ngôn ngữ
    """
    config = get_config()
    template = config.get("messageTemplate", "").strip()
    lang = os.getenv("STREAK_LANGUAGE", config.get("streakLanguage", "vi"))

    # Nếu không đặt template hoặc đặt "[RANDOM]", lấy ngẫu nhiên theo ngôn ngữ
    if not template or template == "[RANDOM]" or template == "[RANDOM_MESSAGE]":
        message = get_random_streak_message(lang)
    else:
        message = template

    # Thay thế các placeholder
    if "[RANDOM_MESSAGE]" in message:
        message = message.replace("[RANDOM_MESSAGE]", get_random_streak_message(lang))

    if "[EMOJI]" in message:
        message = message.replace("[EMOJI]", random.choice(RANDOM_EMOJIS))

    if "[DATE]" in message:
        now_str = datetime.now().strftime("%d/%m/%Y")
        message = message.replace("[DATE]", now_str)

    if "[TIME]" in message:
        now_str = datetime.now().strftime("%H:%M")
        message = message.replace("[TIME]", now_str)

    if "[TARGET]" in message:
        message = message.replace("[TARGET]", target_name if target_name else "bạn")

    if "[API]" in message:
        try:
            api_content = request_hitokoto()
            message = message.replace("[API]", api_content)
        except Exception:
            message = message.replace("[API]", "")

    return message.strip()
