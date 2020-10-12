<template>
  <div>
    <div v-if="quizList.length">
      <span
        v-for="(quiz, i) in quizList"
        :key="`quiz-${i}`"
      >
        <v-card
          class="mx-auto pa-1"
          max-width="700"
          dense
        >
          <v-card-title>
            問題
          </v-card-title>
          <v-card-text>
            {{ quiz.question }}
          </v-card-text>
          <v-btn block outlined color="indigo" class="my-1" @click="showCorrectAnswer('1', quiz.correct_no)">
            {{ quiz.answer_01 }}
          </v-btn>
          <v-btn block outlined color="indigo" class="my-1" @click="showCorrectAnswer('2', quiz.correct_no)">
            {{ quiz.answer_02 }}
          </v-btn>
          <v-btn block outlined color="indigo" class="p-1" @click="showCorrectAnswer('3', quiz.correct_no)">
            {{ quiz.answer_03 }}
          </v-btn>
          <v-btn block outlined color="indigo" class="my-1" @click="showCorrectAnswer('4', quiz.correct_no)">
            {{ quiz.answer_04 }}
          </v-btn>
          <v-card-text>
            <span
              v-for="(tag, j) in quiz.tags"
              :key="`tag-${j}`"
            >
              <!-- <v-chip
                class="ma-2"
                color="pink"
                label
                text-color="white"
              >
                <v-icon left>mdi-label</v-icon>
                {{ tag.name }}
              </v-chip> -->
              <app-tag :name="tag.name" />
            </span>
          </v-card-text>
        </v-card>
      </span>
    </div>
    <div v-else>
      ユーザーが取得できませんでした
    </div>
    <!-- <div class="text-center">
      <v-dialog
        v-model="dialog"
        width="500"
      >
        <v-card>
          <v-card-title class="headline grey lighten-2">
            正解
          </v-card-title>
          <v-card-text>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
          </v-card-text>
        </v-card>
      </v-dialog>
    </div> -->
  </div>
</template>

<script>
import AppTag from '~/components/quiz/Tag.vue'

export default {
  components: {
    AppTag
  },
  async asyncData ({ $axios }) {
    let quizList = []
    await $axios.$get('/api/v1/quizzes')
      .then(res => (quizList = res))
    return { quizList }
  },
  computed: {
    dateFormat () {
      return (date) => {
        const dateTimeFormat = new Intl.DateTimeFormat(
          'ja', { dateStyle: 'medium', timeStyle: 'short' }
        )
        return dateTimeFormat.format(new Date(date))
      }
    }
  },
  methods: {
    showCorrectAnswer (answer, correctNo) {
      if (answer === correctNo) {
        alert('正解')
        // dialog = true
        return
      }
      alert('不正解')
      // dialog = true
    }
  }
}
</script>
